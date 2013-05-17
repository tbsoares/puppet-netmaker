# Used to define/realize users on Puppet-managed systems
#
class accounts {
	@accounts::virtual { 'tiagosoares':
		realname        =>  'Tiago Soares - Netmaker',
		pass            =>  '$6$5uC9tKC4$oE1BrobA5XapAeHdW0UwVe1lNbO8eKwg2jGztFa6ONWs38JnPkDd5YVH8cym.aTyT9PNSRJkb4OYZQ/nR6zFG',
		grupo1		=>  'wheel',
		grupo2		=> 'users',
	}

        @accounts::virtual { 'altairm':
                realname        =>  'Altair Mentz - Netmaker',
                pass            =>  '$6$ntUAz.WJ$cW9PSafbM8omseO/uPl/Lr9E2FEI7yucwE80zrDNZ4Ola5Q2dVbJFkrRZzQkXyFdZW3yHJQd7lDr8R8bKPjWG.',
                grupo1          =>  'wheel',
                grupo2          => 'users',
        }

        @accounts::virtual { 'felipesantos':
                realname        =>  'Felipe Santos - Netmaker',
                pass            =>  '$6$Z0VDONRj$kc/Y94W5fLwzipF33aHbu0QeDkgOcohMKeWpbL9yytb3qt0Sx99jQBJGn0EGrDq/Z.8PJ13SjzlnLx0hQ5CMn1',
                grupo1          =>  'wheel',
                grupo2          => 'users',
        }

        @accounts::virtual { 'sandrotrambaioli':
                realname        =>  'Sandro Trambaioli - Netmaker',
                pass            =>  '$6$Cq68Vvmj42y061XY$DIKLC2ky84vNcu06nDSEXpb/O2UHjbslyr7V9jApt0AmFe4.HBc83cBx9ZBSnth.CDK5jUNKwjKwxgBeRtEfc.',
                grupo1          =>  'wheel',
                grupo2          => 'users',
        }

        @accounts::virtual { 'rafaelferreira':
                realname        =>  'Rafael Ferreira - Netmaker',
                pass            =>  '$6$Ds2bYXhJ$r34rmKr3Y/ArpXenfGon/X0X8RI.Iu80E6t1v0Q3FXDifGT.aR1FFasOuB2nyCr3mNkVHOJkLBMwXuzjamx.l/',
                grupo1          =>  'wheel',
                grupo2          => 'users',
        }

#Modelo de usuario
#        @accounts::virtual { '':
#                realname        =>  '',
#                pass            =>  '',
#                grupo1          =>  'wheel',
#                grupo2          => 'users',
#        }


}
