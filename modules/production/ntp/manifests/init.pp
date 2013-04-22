class ntp {

	package { 'ntp':
        	ensure => absent,
	}

	service { 'ntpd':
        	ensure     => stopped,
	}
}
