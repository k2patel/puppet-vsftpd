# Class: vsftpd::service
#
# Manages the vsftpd daemon
#
# Parameters:
#
# Actions:
#   - Manage vsftpd service
#
# Requires:
#
# Sample Usage:
#
#    sometype { 'foo':
#      notify => Class['vsftpd::service'],
#    }
#
#
class vsftpd::service (
  $service_name   = $::vsftpd::params::service_name,
  $service_enable = true,
  $service_ensure = 'running',
  $service_manage = true,
  $service_restart = undef
) {
  # The base class must be included first because parameter defaults depend on it
  if ! defined(Class['vsftpd::params']) {
    fail('You must include the vsftpd::params class before using any vsftpd defined resources')
  }
  validate_bool($service_enable)
  validate_bool($service_manage)

  case $service_ensure {
    true, false, 'running', 'stopped': {
      $_service_ensure = $service_ensure
    }
    default: {
      $_service_ensure = undef
    }
  }
  if $service_manage {
    service { 'ftpd':
      ensure  => $_service_ensure,
      name    => $service_name,
      enable  => $service_enable,
      restart => $service_restart
    }
  }
}
