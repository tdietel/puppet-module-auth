
class auth::sssd (
    $ldap_uri,
    $ldap_searchbase,
    $ldap_authdn,
    $ldap_authpw )
{

  
  
  package { 'sssd': ensure => installed }

  file { 'sssd.conf':
      ensure   => present,
      path     => '/etc/sssd/sssd.conf',
      owner    => 'root',
      group    => 'root',
      mode     => '0600',
      content  => template('auth/sssd.conf.erb'),
      require  => Package['sssd'],
  }

  service { 'sssd':
    ensure      => 'running',
    require     => [ Package['sssd'], File['sssd.conf'] ],
    #has_restart => true,
    #has_status  => true,
  }
}



# Local Variables:
#   mode: puppet
#     puppet-indent-level: 4
#     indent-tabs-mode: nil
# End:
