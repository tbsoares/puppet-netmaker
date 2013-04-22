class proftpd {

	package { 'proftpd':
        	ensure => present,
	}

	service { 'proftpd':
                ensure     => running,
        }

	
}
