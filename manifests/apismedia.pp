########variaveis globais
##########ZABBIX
        $zabbix_server = "leffe.netmaker.com.br"
        $zabbix_agent_port = "10052"
##########BACULA
#	class { 'bacula':
#		nome_director => "GOKU-DIR",
#		portaFD => 9102,
#		senha_director => "sgereojgsenha randomica aquifklhl23rl2eln2l",
#	}

#nodes
node /apismedia$/ inherits default {
#	include epel
#	include zabbix::agent
}

node 'eive.apismedia' inherits default {
	include zabbix::agent
}
node 'ns2.apismedia' inherits default {
        include zabbix::agent 
}
node 'webserver-01.apismedia' inherits default {
        include zabbix::agent
#	$zabbix_hostname = 'WebServer-01'
}
node 'oumo.apismedia' inherits default {
       class { 'bacula':
               nome_director => "GOKU-DIR",
               portaFD => 9102,
               senha_director => "sgereojgsenha randomica aquifklhl23rl2eln2l",
       }
}

#MestreWEB PRODUCAO
node 'mmc.apismedia' inherits default {
	include zabbix::agent
}

#TopLinguas (WWW e AULAS) PRODUCAO
node 'yon.apismedia' inherits default {
	include zabbix::agent

}

#Servidor teste DEV2 ZEMOLEZA
node 'evere.apismedia' inherits default {
        include zabbix::agent

}

#node "tbsoares.servehttp.com" {
#       class { 'zabbixagent':
#        servers  => 'leffe.netmaker.com.br',
#        hostname => 'tbsoares',
#       }
#}
