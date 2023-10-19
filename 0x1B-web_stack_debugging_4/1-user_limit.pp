# create a new ubuntu user called holberton

user { 'holberton':
  ensure       => 'present',
    managehome => true,
    password   => '1234',
    }