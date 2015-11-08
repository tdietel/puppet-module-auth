# == Class: auth
#
# Configure authentication
#
# === Parameters
#
# [*ldap_uri*] 
#   URI of LDAP server to contact for for authentication. If the value
#   is an empty string, LDAP authentication is disabled.
#
# [*ldap_authdn*] 
#   Searchbase for querying LDAP server.
# 
#   Distinguished name (DN) used to bind to LDAP authentication server.
#  
# [*ldap_authpw*] 
#   Authentication token (password) to be used for bind to LDAP authentication
#   server.
#
# [*mkhomedir*]
#   Install and enable the PAM module 'mkhomedir' (boolean).
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'auth':
#    mkhomedir => true
#  }
#
# === Authors
#
# Tom Dietel <tom@dietel.net>
#
# === Copyright
#
# Copyright 2015 Tom Dietel
#
class auth (
    $ldap_uri = '',
    $ldap_searchbase = '',
    $ldap_authdn = '',
    $ldap_authpw = '',
    $mkhomedir = false )
{
    
    class { 'auth::sssd':
        ldap_uri          => $ldap_uri,     
        ldap_searchbase   => $ldap_searchbase,
        ldap_authdn       => $ldap_authdn, 
        ldap_authpw       => $ldap_authpw, 
        
        #krb5_realm        => $krb5_realm,   
        #krb5_kdcs         => $krb5_kdcs
    }

    #class { 'auth::krb5':
        #    realm         => $krb5_realm,   
        #    kdcs          => $krb5_kdcs,
        #    admin_server  => $krb5_admin_server,
        #}
    
    
    class { 'auth::mkhomedir': enable => $mkhomedir }
    
}


# Local Variables:
#   mode: puppet
#     puppet-indent-level: 4
#     indent-tabs-mode: nil
# End:
