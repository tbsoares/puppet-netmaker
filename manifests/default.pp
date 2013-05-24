#importa ¨node¨ padrao com definicao global que afetara todos os nodes
node default {
	include lsb
#	include etckeeper #incluir depois de testar melhor
	include screen
	include editor
	include epel
	include linux_servers
        include accounts
        realize (Accounts::Virtual['tiagosoares'])
        realize (Accounts::Virtual['altairm'])
        realize (Accounts::Virtual['rafaelferreira'])
        realize (Accounts::Virtual['sandrotrambaioli'])
        realize (Accounts::Virtual['felipesantos'])

}
