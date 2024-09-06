# app.py

from flask import Flask, render_template, request, jsonify
from flight_booking import initiate_flight_booking, handle_flight_booking_input
from train_booking import initiate_train_booking, handle_train_booking_input
from nlp_utils import check_intent
from db_utils import create_db_connection, execute_read_query, execute_query
from order_history import get_order_history

app = Flask(__name__)

# Office dictionary to track user status
user_states = {}

def check_user_in_database(user_name):
    
    connection = create_db_connection()
    if connection is None:
        print("Database connection failed.")
        return False

    query = f"SELECT * FROM users WHERE UserName = '{user_name}'"
    result = execute_read_query(connection, query)

    if result:
        return True
    else:
        return False

def add_new_user_to_database(user_name):
    """
    Add a new user to the database.
    """
    connection = create_db_connection()
    if connection is None:
        print("Database connection failed.")
        return False

    query = f"INSERT INTO users (UserName, PreferencesJSON) VALUES ('{user_name}', '{{\"departure\": \"\"}}')"
    execute_query(connection, query)

@app.route('/')
def index():
    return render_template('chat.html')

@app.route('/check_user', methods=['POST'])
def check_user():
    user_name = request.json.get('user_name', '').strip()

    
    user_exists = check_user_in_database(user_name)

    if not user_exists:
        
        add_new_user_to_database(user_name)
        response_message = "Welcome, new user!"
    else:
        
        response_message = "Welcome back!"

    
    user_states[user_name] = {}

    
    response_message += " How can I assist you today? You can type commands like 'flight ticket', 'train ticket', or 'order history'. If you want to exit, just type 'exit'."
    
    return jsonify({"message": response_message})

@app.route('/chat', methods=['POST'])
def chat():
    user_name = request.json.get('user_name', '').strip()
    user_input = request.json.get('user_input', '').strip()

    print(f"Received input from {user_name}: {user_input}")

    
    if user_name not in user_states:
        user_states[user_name] = {}

    
    if 'type' in user_states[user_name]:
        state_info = user_states[user_name]

        
        if state_info.get('type') == 'flight':
            response_message = handle_flight_booking_input(user_name, user_input, user_states)
        elif state_info.get('type') == 'train':
            response_message = handle_train_booking_input(user_name, user_input, user_states)
        else:
            response_message = "Unknown booking type."

        return jsonify({"message": response_message})

    
    intent = check_intent(user_input)
    print(f"Handling intent: {intent}")

    if intent == 'exit':
        
        if user_name in user_states:
            del user_states[user_name]
        return jsonify({"message": "Exiting... Have a great day!"})

    elif intent == 'flight ticket':
        
        user_states[user_name]['type'] = 'flight'
        response_message = initiate_flight_booking(user_name, user_states)
        return jsonify({"message": response_message})

    elif intent == 'train ticket':
        
        user_states[user_name]['type'] = 'train'
        response_message = initiate_train_booking(user_name, user_states)
        return jsonify({"message": response_message})

    elif intent == 'order history':
        
        if check_user_in_database(user_name):
            order_history = get_order_history(user_name)
            if isinstance(order_history, str):
                response_message = order_history
            else:
                if order_history:
                    response_message = "Here are your past orders:\n"
                    for order in order_history:
                        response_message += f"Type: {order[0]}, From: {order[1]}, To: {order[2]}, Date: {order[3]}, Price: {order[4]}, Status: {order[5]}\n"
                else:
                    response_message = "You have no order history."
        else:
            response_message = "You have no order history."
        
        response_message += " What would you like to do next? You can ask about flight tickets, train tickets, or exit."
        return jsonify({"message": response_message})

    else:
        
        return jsonify({"message": "I'm sorry, I didn't understand that. Can you try a different way? You can ask about flight tickets, train tickets, or order history."})

if __name__ == '__main__':
    app.run(debug=True)
