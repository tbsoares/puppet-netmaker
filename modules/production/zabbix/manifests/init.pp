class zabbix {
	$zabbix_config_dir = "/etc/zabbix"
	$zabbix_user_home_dir = "/var/lib/zabbix"
	$zabbix_log_dir = "/var/log/zabbix/"
	$zabbix_pid_dir= "/var/run/zabbix/"

	file {
        	$zabbix_config_dir:
            	ensure 		=> directory,
   	        owner 		=> root,
        	group 		=> root,
	        mode 		=> 755,
        	require 	=> Package["zabbix20-agent"];

        	$zabbix_log_dir:
	        ensure 		=> directory,
        	owner 		=> zabbix,
	        group 		=> zabbix,
        	mode 		=> 755,
	        require 	=> Package["zabbix20-agent"];

        	$zabbix_pid_dir:
	        ensure 		=> directory,
       		owner 		=> zabbix,
	        group 		=> zabbix,
 	        mode 		=> 755,
        	require 	=> Package["zabbix20-agent"];

      	  	$zabbix_user_home_dir:
        	ensure 		=> directory,
 	     	owner 		=> zabbix,
        	group 		=> zabbix,
   	        mode 		=> 700,
		require 	=> User["zabbix"];

	}
	
	user { 'zabbix':
		ensure		=> 'present',
		home		=> $zabbix_user_home_dir,
		password	=> '!!',
		shell   	=> '/sbin/nologin',
		gid		=> 'zabbix',
		managehome	=> 'true',	
	}

	group { 'zabbix':
		ensure 		=> 'present',
	}


}
