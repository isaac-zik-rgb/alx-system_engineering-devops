# Installing and configuring Nginx on an Ubuntu server using Puppet

# Install Nginx package
package { 'nginx':
  ensure => installed,
  }

# Allowing Nginx through the firewall
service { 'ufw':
  ensure => running,
  }

ufw::allow { 'Nginx HTTP':
  port => 80,
  }

# Create our file
file { '/var/www/html/hello.html':
  ensure  => 'present',
    content => "Hello World!",
    }

# Configure Nginx server with inline template
file { '/etc/nginx/sites-available/default':
  ensure  => 'present',
    content => '
    server {
        listen 80;
            listen [::]:80;

    root /var/www/html;
        index hello.html;

    server_name localhost;

    location / {
            try_files $uri $uri/ =404;
                }

    location /redirect_me {
            rewrite ^ 301 "https://www.youtube.com/watch?v=QH2-TGUlwu4";
                }
                }
                ',
                  require => Package['nginx'],
                  }

# Enable the site and restart Nginx
exec { 'enable_site_and_restart':
  command => 'ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default && service nginx restart',
    require => [File['/etc/nginx/sites-available/default'], Package['nginx']],
    }
    