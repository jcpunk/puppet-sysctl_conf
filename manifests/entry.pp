# @summary A short summary of the purpose of this defined type.
#
# A description of what this defined type does
#
# @example
#   sysctl_conf::entry { 'namevar': }
define sysctl_conf::entry (
  String           $ensure = 'present',
  Optional[String] $value  = undef,
  Optional[String] $target = "/etc/sysctl.d/${title}.conf",
){

  # herculesteam-augeasproviders_sysctl resource
  sysctl { $title:
    ensure => $ensure,
    value  => $value,
    target => $target,
  }

}
