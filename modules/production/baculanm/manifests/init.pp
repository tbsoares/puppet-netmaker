class baculanm (
		$senha_director,
		$nome_director,
		$portaFD
		) {

        case $operatingsystem {
                CentOS,RedHat: {
			file { '/etc/init.d/bacula':
        	        	ensure  => present,
	                	source  => 'puppet:///files/baculanm/bacula_init_centos',
	        	}
			
			package { 'zlib-devel':
     				ensure => present,
			}
			package { 'gcc-c++':
                                ensure => present,
                        }
    		}
		Debian,Ubuntu: {
			package { 'zlib1g-dev':
                                ensure => present,
                        }
			package { 'gcc-c++':
                                ensure => present,
                        }
		}
		
	}

        file { '/etc/bacula/bacula-fd.conf':
                ensure  => file,
                content => template('baculanm/bacula-fd.conf.erb'),
                notify  => Service['bacula'],
        }

#	file { '/etc/bacula/bacula-fd.conf':
#                ensure  => file,
#                content => template('baculanm/bacula-fd.conf.erb'),
#        }

        service { 'bacula':
                ensure  => running,
                enable  => true,
        }
}
