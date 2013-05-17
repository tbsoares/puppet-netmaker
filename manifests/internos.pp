node internos inherits default { }


node 'atom.rbferreira.com.br', 'tbsoares.servehttp.com' inherits internos { 
	stage {
		"pre": ;
	}
	include zabbix::agent
	include accounts
	realize (Accounts::Virtual['tiagosoares'])
	realize (Accounts::Virtual['altairm'])
	realize (Accounts::Virtual['felipesantos'])
#	include baculanm
#	puppi::netinstall { 'baculanm':
#		url                 => 'http://leffe.netmaker.com.br/utils/bacula-5.2.13.zip',
#		destination_dir     => '/usr/src', # Must Exist
#		postextract_command => "/usr/src/bacula-5.2.13/configure --libdir='/usr/lib64' --enable-client-only ; make ; sudo make install",
#	}
	class {'baculanm::compila': stage => "pre";}
	class { 'baculanm':
               nome_director => "GOKU-DIR",
               portaFD => 9102,
               senha_director => "sgereojgsenha randomica aquifklhl23rl2eln2l",
       }
	
	Stage["pre"] -> Stage["main"]
}

#node "tbsoares.servehttp.com" {
#       class { 'zabbixagent':
#        servers  => 'leffe.netmaker.com.br',
#        hostname => 'tbsoares',
#       }
#}
