class editor {
 
      # detectando o sistema operacional para
      # definir algumas variaveis
 
      case $operatingsystem {
                CentOS,RedHat: {
                        $vim        = 'vim-enhanced'
                }
                Debian,Ubuntu: {
                        $vim        = 'vim'
                }
        }
 
    # declarando o pacote
 
    package { "$vim":
        ensure => present,
        alias  => 'vim',
    }

#file {'/tmp/test1':
#      ensure  => present,
#      content => "Hi.",
#      before  => Notify['/tmp/test1 has already been synced.'],
#    }
#    notify {'/tmp/test1 has already been synced.':}
}
