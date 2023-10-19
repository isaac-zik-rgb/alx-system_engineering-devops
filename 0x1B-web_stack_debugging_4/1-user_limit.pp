# create a new ubuntu user called holberton
exec { 'add new user':
  command => 'adduser holberton',
    path  => '/usr/sbin/',
    }
