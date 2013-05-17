class lsb {

      case $operatingsystem {
                CentOS,RedHat: {
                        $lsb        = 'redhat-lsb'
                }
                Debian,Ubuntu: {
                        $lsb        = 'lsb-release'
                }
        }

  package { "$lsb":
    ensure => installed,
  }
}
