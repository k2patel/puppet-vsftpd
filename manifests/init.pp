#== Class: vsftpd
#
# This claass install vsftpd server and configure to use.
#
#== Parameters: None
#
#== Actions:
# include vsftpd
#
#== Author: 
# Ketan patel <k2patel@gmail.com>
#
#############################
class vsftpd (
   $package_ensure         = 'installed',
   $service_name           = $::vsftpd::params::service_name,
   $service_enable         = true,
   $service_manage         = true,
   $service_ensure         = 'running',
   $service_restart        = undef,
   $conf_dir               = $::vsftpd::params::conf_dir,
   $conf_template          = $::vsftpd::params::conf_template,
   ) inherits ::vsftpd::params {

      class { '::vsftpd::service':
         service_name    => $service_name,
         service_enable  => $service_enable,
         service_manage  => $service_manage,
         service_ensure  => $service_ensure,
         service_restart => $service_restart,
      }

      if $::osfamily != 'FreeBSD' {
         package { 'ftpd':
         ensure => $package_ensure,
         name   => $vsftpd_name,
         notify => Class['Vsftpd::Service'],
      }
 
      file { "${::vsftpd::conf_dir}/${::vsftpd::params::conf_file}":
         ensure  => file,
         content => template($conf_template),
         notify  => Class['Vsftpd::Service'],
         require => [Package['ftpd']],
      }
  }
}
