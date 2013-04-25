class linux_server {

	file { '/usr/local/sbin/newcreateSSH2.sh':
#		replace => "no",
		ensure  => present,
                source  => "puppet:///files/linux_servers/newcreateSSH.sh",
	        owner  => 'root',
        	group  => 'root',
	        mode   => 755,
	}
}
