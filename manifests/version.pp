# Class: vsftpd::version
#
# Try to automatically detect the version by OS
#
class vsftpd::version {
  # This will be 5 or 6 on RedHat, 6 or wheezy on Debian, 12 or quantal on Ubuntu, etc.
  $osr_array = split($::operatingsystemrelease,'[\/\.]')
  $distrelease = $osr_array[0]
  if ! $distrelease {
    fail("Class['vsftpd::version']: Unparsable \$::operatingsystemrelease: ${::operatingsystemrelease}")
  }

  case $::osfamily {
    'RedHat': {
      if ($::operatingsystem == 'Amazon') {
        $default = '3.0'
      } elsif ($::operatingsystem == 'Fedora' and versioncmp($distrelease, '18') >= 0) or ($::operatingsystem != 'Fedora' and versioncmp($distrelease, '7') >= 0) {
        $default = '3.0.2'
      } else {
        $default = '3.0.2'
      }
    }
    'Debian': {
      if $::operatingsystem == 'Ubuntu' and versioncmp($::operatingsystemrelease, '13.10') >= 0 {
        $default = '3.0.2'
      } elsif $::operatingsystem == 'Debian' and versioncmp($distrelease, '8') >= 0 {
        $default = '3.0.2'
      } else {
        $default = '3.0.2'
      }
    }
    'FreeBSD': {
      $default = '3.0.2'
    }
    'Gentoo': {
      $default = '3.0.2'
    }
    'Suse': {
      $default = '3.0.2'
    }
    default: {
      fail("Class['vsftpd::version']: Unsupported osfamily: ${::osfamily}")
    }
  }
}
