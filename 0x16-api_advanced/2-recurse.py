#!/usr/bin/python3
"""a recursive function that queries the Reddit API and returns a list
containing the titles of all hot articles for a given subreddit"""
import requests


def recurse(subreddit, hot_list=None, after=None):
    """queries the Reddit API and returns a list
containing the titles of all hot articles"""
    hot_list = [] if hot_list is None else hot_list
    url = f"https://www.reddit.com/r/{subreddit}/hot.json?after={after}"
    headers = {'User-Agent': 'PythonScript/3.0'}
    response = requests.get(url, headers=headers)
    try:
        response.raise_for_status()
        data = response.json()
        children = data.get('data', {}).get('children', [])

        for post in children:
            title = post.get('data', {}).get('title', '')
            hot_list.append(title)

        next_page = data.get('data', {}).get('after', '')
        if next_page:
            recurse(subreddit, hot_list, next_page)
        return hot_list

    except requests.exceptions.RequestException as e:
        return None
