class linux_servers {

	file { '/usr/local/sbin/newcreateSSH.sh':
#		replace => "no",
		ensure  => present,
                source  => "puppet:///files/linux_servers/newcreateSSH.sh",
	        owner  => 'root',
        	group  => 'root',
	        mode   => 755,
	}
}
