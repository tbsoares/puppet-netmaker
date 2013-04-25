node "atom.rbferreira.com.br" {
       class { 'zabbixagent':
        servers  => 'leffe.netmaker.com.br',
        hostname => 'atom.teste',
       }
}
