# A puppet file that kills a proccess named killmenow
exec { 'kill_my_process':
  command => '/usr/bin/pkill killmenow',
  }