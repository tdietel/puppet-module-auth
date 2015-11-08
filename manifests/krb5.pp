
class auth::krb5 ( $realm, $admin_server, $kdcs )
{

    case $operatingsystem {
        darwin: {}
        default: {
            package {[ "krb5-config", "krb5-clients", "krb5-user" ]:
                ensure => installed
            }
        }
    }

    file { "krb5.conf": 
        name => $operatingsystem ? {
            darwin => "/Library/Preferences/edu.mit.Kerberos", 
            default => "/etc/krb5.conf",
        },
        
        ensure => file,
        content => template('auth/krb5.conf.erb')
    }

    
}


# Local Variables:
#   mode: puppet
#     puppet-indent-level: 4
#     indent-tabs-mode: nil
# End:

