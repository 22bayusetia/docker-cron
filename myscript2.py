# myscript.py

print("Executing myscript.py")

import datetime

def my_function():
    # current_time = datetime.datetime.now()
    # print("Script executed at:", current_time)
    raise ValueError("Raised Error")

if __name__ == "__main__":
    my_function()
