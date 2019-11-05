# @summary Simple sysctl entries management
#
# A description of what this class does
#
# @example
#   include sysctl_conf
class sysctl_conf (
  Hash $values = {},
  ){

  create_resources(sysctl_conf::entry, $values)

}