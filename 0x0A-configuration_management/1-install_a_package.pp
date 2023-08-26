# Using puppet to install flask with the version 2.1.0
exec { 'flask':
    command => '/usr/bin/pip3 install flask=2.1.0',
    unless  => '/usr/bin/pip3 install show flask | grep "Version: 2.1.0"',
    }