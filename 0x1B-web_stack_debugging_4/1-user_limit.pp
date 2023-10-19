# create a new ubuntu user called holberton
# Define the 'holberton' user
user { 'holberton':
  ensure       => 'present',
    managehome => true, # Create the user's home directory
    }

user_password { 'holberton':
  password => '1234',
  }