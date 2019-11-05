# @summary Simple sysctl entries management
#
# Assigns given sysctl key a defined value
#
# @example
#   include sysctl_conf
class sysctl_conf (
  Hash $values = {},
  Hash $defaults = {},
  ){

  create_resources(sysctl_conf::entry, $values, $defaults)

}