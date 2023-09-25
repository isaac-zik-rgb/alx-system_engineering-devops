#!/usr/bin/python3
"""Exports to-do list information for a given employee ID to JSON format."""
import json
import requests
import sys

if __name__ == "__main__":
    url = "https://jsonplaceholder.typicode.com/"
    user_id = sys.argv[1]
    user = requests.get(url + "users/{}".format(user_id)).json()
    todos = requests.get(url + "todos", params={"userId": user_id}).json()
    username = user.get("username")
    users_id = user.get("id")
    users_info = {
        users_id: [
            {
                "task": t.get("title"),
                "completed": t.get("completed"),
                "username": username
            } for t in todos]
    }
    with open("{}.json".format(users_id), "w") as json_file:
        json.dump(users_info, json_file)
