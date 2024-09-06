import mysql.connector
from mysql.connector import Error
from db_utils import create_db_connection, execute_read_query

def get_order_history(user_name):
    
    connection = create_db_connection()
    if connection is None:
        return "Database connection failed."

    query = f"""
    SELECT order_type, departure, destination, date, price, status
    FROM order_history
    WHERE user_name = '{user_name}'
    """

    result = execute_read_query(connection, query)
    if result is None:
        return "Failed to retrieve order history."

    return result
