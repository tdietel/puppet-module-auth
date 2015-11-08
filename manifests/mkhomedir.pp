# Class: auth::mkhomedir
#
# enable the pam_mkhomedir module
#
# Parameters:
#   (none)
#
# Actions:
#   - install and enable PAM module 'mkhomedir'
#
# Requires:
#   - 
#
# Sample Usage:
#   include auth::mkhomedir
#
# This class should be instantiated via the main auth class.
#
class auth::mkhomedir (
    $enable = true )
{
    case $operatingsystem {

        'Debian': {

            if ($enable) {
                augeas { "pam_mkhomedir":
                    context => "/files/etc/pam.d/common-session",
                    changes => ['ins 1000 after *[last()]',
                                'set *[last()]/type "session"',
                                'set *[last()]/control "optional"',
                                'set *[last()]/module "pam_mkhomedir.so"',
                                ],
                    onlyif  => 'match *[module = "pam_mkhomedir.so"] size == 0',
                }
            }
        }

        default: {
            err "OS '$operatingsystem' not supported"
        }
    }
    
}



# Local Variables:
#   mode: puppet
#     puppet-indent-level: 4
#     indent-tabs-mode: nil
# End:
