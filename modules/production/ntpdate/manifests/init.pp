class ntpdate {

	package { 'ntpdate':
        	ensure => present,
	}
	
	file { '/etc/cron.daily/acertahora':
		replace => "no",
		ensure  => present,
                source  => "puppet:///files/ntpdate/acertahora",
	        owner  => 'root',
        	group  => 'root',
	        mode   => 755,
		require => Package["ntpdate"],
	}
}
