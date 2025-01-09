#!/usr/bin/python3
"""a function that queries the Reddit API and
returns the number of subscribers"""
import requests


def number_of_subscribers(subreddit):
    """Returns total number of subscribers"""

    url = f'https://www.reddit.com/r/{subreddit}/about.json'
    header = {'User-Agent': 'PythonScript/3.0'}
    response = requests.get(url, header, timeout=60)

    if response.status_code == 200:
        data = response.json()
        subscribers = data.get('data', {}).get('subscribers', 0)
        return subscribers
    else:
        return 0
