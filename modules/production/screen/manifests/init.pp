class screen {
  package { 'screen': ensure => present, }

  file { '/root/.screenrc':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => 0400,
    replace => true,
    source  => 'puppet:///files/screen/.screenrc',
  }
  
}
