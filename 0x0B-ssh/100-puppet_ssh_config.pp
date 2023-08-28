file { '/home/chuks_dev/.ssh/config':
     ensure => file,
     owner => 'chuks_dev',
     group => 'chuks_dev',
     mode => '0600',
     content => "
     Host *
     IdentityFile ~/.ssh/school
     PasswordAuthentication no
     ",
     }