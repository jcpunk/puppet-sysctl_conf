# @summary Simple sysctl entries management
#
# Assigns given sysctl key a defined value
#
# @example
#   include sysctl_conf
#
#
# @param values
#   Hash containing sysctl configuration keys and its values
# @param defaluts
#   Hash with default values for each `$values` entry.
#
class sysctl_conf (
  Hash $values = {},
  Hash $defaults = {},
  ){

  create_resources(sysctl_conf::entry, $values, $defaults)

}