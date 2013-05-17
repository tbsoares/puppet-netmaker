class baculanm::compila	{
	case $architecture {
		'x86_64': {
			puppi::netinstall { 'baculanm':
	                url                 => 'http://leffe.netmaker.com.br/utils/bacula-5.2.13.zip',
	                destination_dir     => '/usr/src', # Must Exist
        	        postextract_command => "/usr/src/bacula-5.2.13/configure --libdir='/usr/lib64' --enable-client-only && make && make install",
	        	}
	
		}

		'i386':{
			puppi::netinstall { 'baculanm':
	                url                 => 'http://leffe.netmaker.com.br/utils/bacula-5.2.13.zip',
        	        destination_dir     => '/usr/src', # Must Exist
                	postextract_command => "/usr/src/bacula-5.2.13/configure --enable-client-only ; make ; make install",
	        	}
		}
	}
}
