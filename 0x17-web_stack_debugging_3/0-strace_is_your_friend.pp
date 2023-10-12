# Puppet manifest to fix a bug in wp-setings.php

# Define a class for WordPress installation
class wordpress {
  package { 'apache2':
      ensure => installed,
        }

  package { 'mysql-server':
      ensure => installed,
        }

  package { 'php':
      ensure => installed,
        }

  package { 'php-mysql':
      ensure => installed,
        }

  # Download and extract WordPress
    exec { 'download-wordpress':
        command => '/usr/bin/wget -O /tmp/latest.tar.gz https://wordpress.org/latest.tar.gz',
            creates => '/tmp/latest.tar.gz',
              }

  exec { 'extract-wordpress':
      command => '/bin/tar -xzvf /tmp/latest.tar.gz -C /var/www/html/',
          creates => '/var/www/html/wordpress',
            }

  # Configure WordPress database
    exec { 'configure-wordpress-db':
        command => '/usr/bin/mysql -e "CREATE DATABASE wordpress"',
            unless  => '/usr/bin/mysql -e "SHOW DATABASES" | /bin/grep -q wordpress',
              }

  exec { 'configure-wordpress-db-user':
      command => '/usr/bin/mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO wordpressuser@localhost IDENTIFIED BY \'password\'"',
          unless  => '/usr/bin/mysql -e "SELECT User, Host FROM mysql.user" | /bin/grep -q "wordpressuser"',
            }

  # Configure WordPress
    file { '/var/www/html/wordpress/wp-config.php':
        ensure  => present,
            content => template('wordpress/wp-config.erb'),
              }
              }

# Apply the class to the node
node 'your_wordpress_server_node' {
  include wordpress
  }
  