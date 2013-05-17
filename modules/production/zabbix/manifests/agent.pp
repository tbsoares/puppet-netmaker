class zabbix::agent inherits zabbix {
	$zabbix_userparameter_config_dir = "/etc/zabbix/zabbix_agentd"
	$zabbix_agentd_conf = "$zabbix_config_dir/zabbix_agentd.conf"

	package {
        	"zabbix20-agent":
		ensure	=> installed,
		require	=> Yumrepo['epel']
    }

	file {
        	$zabbix_userparameter_config_dir:
            	ensure 	=> directory,
           	owner 	=> root,
            	group 	=> root,
            	mode 	=> 755,
            	require => [ Package["zabbix20-agent"], File["$zabbix_config_dir"] ];

        	$zabbix_agentd_conf:
            	owner 	=> root,
            	group 	=> root,
            	mode 	=> 644,
            	content => template("zabbix/zabbix_agentd_conf.erb"),
		notify	=> Service['zabbix-agent'],
            	require => [ Package["zabbix20-agent"], File["$zabbix_config_dir"] ];
		
		'/etc/zabbix_agentd.conf':
 		ensure => 'link',
		target => $zabbix_agentd_conf,
	}

    	service {
        	"zabbix-agent":
            	enable 		=> true,
            	ensure 		=> running,
		hasstatus	=> false,
		hasrestart	=> true,
            	require 	=> [ Package["zabbix20-agent"], File["$zabbix_config_dir"], File["$zabbix_log_dir"], File["$zabbix_pid_dir"] ];
    }

}
