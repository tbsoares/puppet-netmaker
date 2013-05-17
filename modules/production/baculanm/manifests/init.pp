class baculanm (
		$senha_director,
		$nome_director,
		$portaFD
		) {

        file { '/etc/init.d/bacula':
                ensure  => present,
                source  => 'puppet:///files/baculanm/bacula_init_centos',
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
