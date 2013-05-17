# Defined type for creating virtual user accounts
define accounts::virtual ($grupo1,$grupo2,$realname,$pass) {

	user { $title:
		ensure            =>  'present',
		#uid               =>  $uid,
		#gid               =>  $title,
		groups            => [$grupo1, $grupo2],
		shell             =>  '/bin/bash',
		home              =>  "/home/${title}",
		comment           =>  $realname,
		password          =>  $pass,
		managehome        =>  true,
#		require           =>  Group[$title],
	}

#	group { $title:
#		gid               =>  $grupos
#	}

	file { "/home/${title}":
		ensure            =>  directory,
		owner             =>  $title,
		group             =>  $title,
		mode              =>  0750,
		require           =>  [ User[$title] ],
#		require           =>  [ User[$title], Group[$title] ],
	}

        file { "/home/${title}/.ssh":
                ensure      => "directory",
                owner       => "${title}",
                group       => "${title}",
                mode        => "0700",
        }

        file { "/home/${title}/.ssh/authorized_keys":
                ensure  => present,
                owner   => "${title}",
                group   => "${title}",
                mode    => 0400,
                replace => true,
                source  => "puppet:///files/netmakerusers/authorized_keys_${title}",
                require => File["/home/${title}/.ssh"],
	}

}
