# This script configure nginx ULIMIT to accept concurrence traffic

exec { 'fix-nginx-config':
  command => 'sed -i "s/15/4096/" /etc/default/nginx',
    path  => ['/usr/local/bin', '/bin'],
    }

# Restarting nginx
exec { 'nginx-restart':
  command => '/etc/init.d/nginx restart',
  path    => ['/sbin', '/usr/sbin', '/bin', '/usr/bin'],
  require => Exec['fix-nginx-config'], # Ensure that nginx is restarted after the config change.
  }
