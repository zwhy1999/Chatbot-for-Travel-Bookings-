# flight_booking.py

from db_utils import create_db_connection, execute_read_query, execute_query
from user_prefs import get_user_preferences, update_user_preferences

def initiate_flight_booking(user_name, user_states):
    """
    Start the flight ticket booking process.
    """
    preferences = get_user_preferences(user_name)
    default_departure = preferences.get('departure', '')
    if default_departure:
        user_states[user_name] = {'status': 'awaiting_confirmation', 'departure_city': default_departure, 'type': 'flight'}
        return f"Do you want to use your usual departure city {default_departure}? (yes/no)"
    else:
        user_states[user_name] = {'status': 'awaiting_departure_city', 'type': 'flight'}
        return "Please enter your departure city:"

def handle_flight_booking_input(user_name, user_input, user_states):
    """
    Processing user input during the air ticket booking process.
    """
    state_info = user_states.get(user_name)
    if not state_info:
        return "Error: No booking session found for the user."

    # Check to re-enter or exit keywords
    if user_input.lower() in ["重新输入", "re-enter"]:
        state_info['status'] = 'awaiting_departure_city'
        return "Please enter your departure city again."
    elif user_input.lower() == "exit":
        del user_states[user_name]
        return "Exiting flight booking... What would you like to do next?"

    response_message = ""

    if state_info['status'] == 'awaiting_confirmation':
        if user_input.lower() == "yes":
            response_message = book_flight_ticket(user_name, user_states, use_default=True)
        else:
            state_info['status'] = 'awaiting_departure_city'
            response_message = "Please enter your departure city."

    elif state_info['status'] == 'awaiting_departure_city':
        response_message = book_flight_ticket(user_name, user_states, departure_city=user_input)

    elif state_info['status'] == 'awaiting_destination':
        response_message = get_destination(user_name, user_input, user_states)

    elif state_info['status'] == 'awaiting_date':
        response_message = proceed_with_date(user_name, user_input, user_states)

    elif state_info['status'] == 'awaiting_flight_selection':
        response_message = confirm_booking(user_name, user_input, user_states)

    elif state_info['status'] == 'awaiting_confirmation_of_booking':
        response_message = finalize_booking(user_name, user_input, user_states)

    return response_message

def book_flight_ticket(user_name, user_states, use_default=False, departure_city=None):
    """
    Specific logic for handling airline ticket reservations.
    """
    connection = create_db_connection()
    if connection is None:
        return "Database connection failed."

    if use_default:
        departure_city = user_states[user_name]['departure_city']

    if not departure_city:
        return "Error: No departure city provided."

   
    new_preferences = {'departure': departure_city}
    update_user_preferences(user_name, new_preferences)

    
    response_message = "Please enter your destination:"
    user_states[user_name]['status'] = 'awaiting_destination'
    user_states[user_name]['departure_city'] = departure_city

    return response_message

def get_destination(user_name, user_input, user_states):
    """
    Receive the destination entered by the user and request a departure date.
    """
    destination = user_input
    user_states[user_name]['destination'] = destination
    user_states[user_name]['status'] = 'awaiting_date'
    
    return "Please enter your departure date (YYYY-MM-DD):"

def proceed_with_date(user_name, user_input, user_states):
    """
    
    """
    date = user_input
    state_info = user_states[user_name]
    departure_city = state_info['departure_city']
    destination = state_info['destination']

    connection = create_db_connection()
    if connection is None:
        return "Database connection failed."

    query = f"""
    SELECT * FROM Flights
    WHERE Departure = '{departure_city}' AND Destination = '{destination}' AND Date = '{date}'
    """
    available_flights = execute_read_query(connection, query)

    if not available_flights:
        return handle_london_transfer(connection, user_name, user_states, departure_city, destination, date)

    
    flight_options = "\n".join([
        f"{index + 1}: Flight {flight[0]} - From {flight[1]} to {flight[2]} on {flight[3]} - ${flight[4]} ({flight[5]} tickets left)"
        for index, flight in enumerate(available_flights)
    ])
    response_message = f"Here are the available flights:\n{flight_options}\nPlease select a flight by index."

    
    user_states[user_name].update({
        'status': 'awaiting_flight_selection',
        'available_flights': available_flights,
        'date': date
    })

    return response_message

def handle_london_transfer(connection, user_name, user_states, departure_city, destination, date):
    """
    """
    response_message = "No direct flights found. Checking options via London..."

    
    train_query = f"""
    SELECT * FROM Trains
    WHERE Departure = '{departure_city}' AND Destination = 'London' AND Date = '{date}'
    """
    available_trains = execute_read_query(connection, train_query)

    if not available_trains:
        user_states[user_name]['status'] = 'awaiting_date'
        return "No available flights or train options found, please re-enter your search criteria or type 'exit' to quit."

    train_options = "\n".join([
        f"{index + 1}: Train {train[0]} - From {train[1]} to {train[2]} on {train[3]} - £{train[4]} ({train[5]} tickets left)"
        for index, train in enumerate(available_trains)
    ])
    response_message += f"\nAvailable train options to London:\n{train_options}\nPlease select a train to London by index."

        
    train_selection = 1  
    selected_train = available_trains[train_selection - 1]

    # Find flight tickets from London to your destination for departure dates.
    flight_query = f"""
    SELECT * FROM Flights
    WHERE Departure = 'London' AND Destination = '{destination}' AND Date = '{date}'
    """
    available_flights = execute_read_query(connection, flight_query)

    if not available_flights:
        return "No available flights found from London to your destination. Please re-enter your search criteria or type 'exit' to quit."

    flight_options = "\n".join([
        f"{index + 1}: Flight {flight[0]} - From {flight[1]} to {flight[2]} on {flight[3]} - ${flight[4]} ({flight[5]} tickets left)"
        for index, flight in enumerate(available_flights)
    ])
    response_message += f"\nAvailable flight options from London:\n{flight_options}\nPlease select a flight from London by index."

    #     
    flight_selection = 1  
    selected_flight = available_flights[flight_selection - 1]

    # Confirm a reservation for two journeys
    response_message += (
        f"\nYou have selected to travel from {departure_city} to London by train and then fly from London to {destination} "
        f"on {selected_flight[3]}. Confirm booking? (yes/no): "
    )

    user_states[user_name]['status'] = 'awaiting_confirmation_of_booking'
    user_states[user_name]['selected_train'] = selected_train
    user_states[user_name]['selected_flight'] = selected_flight

    return response_message

def confirm_booking(user_name, user_input, user_states):
    """
    
    """
    state_info = user_states[user_name]
    available_flights = state_info['available_flights']
    try:
        flight_selection = int(user_input)
        selected_flight = available_flights[flight_selection - 1]
    except (ValueError, IndexError):
        return "Invalid selection. Please select a flight by index."

    user_states[user_name]['status'] = 'awaiting_confirmation_of_booking'
    user_states[user_name]['selected_flight'] = selected_flight

    return (
        f"You have selected to fly from {selected_flight[1]} to {selected_flight[2]} "
        f"on {selected_flight[3]} for ${selected_flight[4]}. Confirm booking? (yes/no): "
    )

def finalize_booking(user_name, user_input, user_states):
    """
    
    """
    state_info = user_states[user_name]
    selected_flight = state_info['selected_flight']

    if user_input.lower() == 'yes':
        if selected_flight[5] > 0:
            new_tickets_left = selected_flight[5] - 1
            update_query = f"UPDATE Flights SET TicketsLeft = {new_tickets_left} WHERE FlightID = {selected_flight[0]}"
            execute_query(create_db_connection(), update_query)
            
            
            add_order_to_history(user_name, 'flight', selected_flight[1], selected_flight[2], selected_flight[3], selected_flight[4], 'Confirmed')

            response_message = "Booking successful!"
        else:
            response_message = "Unfortunately, this flight is fully booked."
    else:
        response_message = "Booking canceled."

    
    del user_states[user_name]

    return response_message + " What would you like to do next?"

def add_order_to_history(user_name, order_type, departure, destination, date, price, status):
    """
    
    """
    connection = create_db_connection()
    if connection is None:
        print("Database connection failed.")
        return

    insert_query = f"""
    INSERT INTO order_history (user_name, order_type, departure, destination, date, price, status)
    VALUES ('{user_name}', '{order_type}', '{departure}', '{destination}', '{date}', {price}, '{status}')
    """
    execute_query(connection, insert_query)

def get_input(prompt):
    """
    
    """
    user_input = input(prompt).strip().lower()
    if user_input == "exit":
        print("Exiting... Have a great day!")
        exit()
    return user_input
