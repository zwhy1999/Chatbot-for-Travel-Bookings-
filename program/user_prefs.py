# user_prefs.py

import json

def get_user_preferences(user_name):
    # Simulate getting user preferences from the database
    try:
        with open(f"{user_name}_prefs.json", "r") as file:
            return json.load(file)
    except FileNotFoundError:
        return {}

def update_user_preferences(user_name, new_preferences):
    # Simulate updating user preferences to the database
    with open(f"{user_name}_prefs.json", "w") as file:
        json.dump(new_preferences, file)
