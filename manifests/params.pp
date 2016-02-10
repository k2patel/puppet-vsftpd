# Class: vsftpd::params
#
# This class manages Apache parameters
#
# Parameters:
# - The $user that Apache runs as
# - The $group that Apache runs as
# - The $apache_name is the name of the package and service on the relevant
#   distribution
# - The $php_package is the name of the package that provided PHP
# - The $ssl_package is the name of the Apache SSL package
# - The $apache_dev is the name of the Apache development libraries package
# - The $conf_contents is the contents of the Apache configuration file
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
class vsftpd::params inherits ::vsftpd::version {
   $vsftpd_name              = 'vsftpd'
   $service_name             = 'vsftpd'
   $conf_dir                 = '/etc/vsftpd'
   $conf_file                = 'vsftpd.conf'
   $conf_template            = 'vsftpd/vsftpd.conf.erb'
   $anonymous_enable         = 'YES'
   $local_enable             = 'YES'
   $write_enable             = 'YES'
   $local_umask              = '022'
   $dirmessage_enable        = 'YES'
   $xferlog_enable           = 'YES'
   $connect_from_port_20     = 'YES'
   $xferlog_std_format       = 'YES'
   $listen                   = 'YES'
   $listen_ipv6              = 'YES'
  
   $pam_service_name         = 'vsftpd'
   $userlist_enable          = 'YES'
   $tcp_wrappers             = 'YES'

   $anon_world_readable_only = 'YES'
   $anon_upload_enable       = 'YES'
   $anon_mkdir_write_enable  = 'YES'

   $chmod_enable             = 'NO'
   $chown_uploads            = 'YES'
   $chown_username           = 'ftp'
   $anon_umask               = '022'
   $dual_log_enable          = 'YES'
   $log_ftp_protocol         = 'YES'
   $anon_other_write_enable  = 'YES'
   $use_sendfile             = 'NO'
  }
