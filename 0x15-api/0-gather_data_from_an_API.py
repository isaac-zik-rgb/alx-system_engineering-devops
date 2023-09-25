#!/usr/bin/python3
""" A python script that using REST API for a given
employee ID return information abut his/her TODO list """
import requests
import sys

if __name__ == "__main__":
    base = "https://jsonplaceholder.typicode.com/"
    user = requests.get(base + "users/{}".format(sys.argv[1])).json()
    todos = requests.get(base + "todos", params={"userId": sys.argv[1]}).json()
    completed = [task.get("title") for task in todos if
                 task.get("completed") is True]
    print("Employee {} is done with tasks({}/{}):".
          format(user.get("name"), len(completed), len(todos)))
    [print("\t{}".format(title)) for title in completed]
