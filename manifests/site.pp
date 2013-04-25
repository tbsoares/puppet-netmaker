#import "Classes/*.pp"       # Site-specific classes
#import "Clientes/Outros/*.pp"         # Arquivos do cliente OUTROS
#import "Clientes/Netmaker/*.pp"         # Arquivos do cliente Netmaker
#import "Clientes/Apismedia/*.pp"         # Arquivos do cliente Apismedia
import "nodes/*.pp"         # Node files
#node "atom.rbferreira.com.br" {
#	class { 'zabbixagent':
#        servers  => 'leffe.netmaker.com.br',
#        hostname => 'atom.teste',
#	}
#}
