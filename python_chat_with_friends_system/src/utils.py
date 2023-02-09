import random
import string
import re

def is_port_in_use(port: int):
    import socket
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
        return s.connect_ex(('localhost', port)) == 0

def generate_x_random_string(x: int):
    return ''.join(random.choices(string.ascii_uppercase + string.digits, k=x))

def generate_x_random_number_string(x: int):
    return ''.join(random.choices(string.digits, k=x))

def check_if_it_is_email(email: str):
    return re.match(r"[^@]+@[^@]+\.[^@]+", email) is not None