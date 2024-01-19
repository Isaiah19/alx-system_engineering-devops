#Install flask version 2.1.0

package { 'python3-pip':
  ensure => installed,
}

package { 'Flask':
  ensure   => '2.1.0',
  provider => 'pip3',
}

package { 'Werkzeug':
  ensure   => '2.0.1', # Use a compatible version with Flask 2.1.0
  provider => 'pip3',
}
