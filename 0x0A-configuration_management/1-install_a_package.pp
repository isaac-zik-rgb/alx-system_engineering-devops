# Using puppet to install flask with the version 2.1.0
exec { 'install_flask':
  command => '/usr/bin/pip3 install flask==2.1.0',
    creates => '/usr/local/lib/python3.x/site-packages/flask',
      path    => ['/usr/bin', '/usr/local/bin'],
      }
      