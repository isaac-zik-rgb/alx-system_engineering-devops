# Define a class for Apache installation and configuration
class apache {
  package { 'apache2':
      ensure => installed,
        }

  service { 'apache2':
      ensure  => running,
          enable  => true,
              require => Package['apache2'],
                }

  Hosts or additional Apache modules.
  }


node 'your_apache_server_node' {
  include apache
  }
  