# @summary Represents sysctl configuration directive
#
# Sets a sysctl key, its value and persists configuration on disk.
#
# @see https://github.com/hercules-team/augeasproviders_sysctl
#
# Do not use direcly, should be used from the `sysctl_conf` class.
#
# @param ensure
# @param value
# @param persist
#  When true (default) configuration will be persisted on disk in
#  file given by `target` path.
# @param target
#   Path to file where configuration is persisted.
# @param apply
#   When true (default) update value with the `sysctl` command
# @param silent
#   When true failures on non-activated configuration will be ignored.
# @param comment
#   Optional comment

define sysctl_conf::entry (
  String           $ensure  = 'present',
  Boolean          $apply   = true,
  Boolean          $persist = true,
  Boolean          $silent  = false,
  Optional[String] $value   = undef,
  Optional[String] $comment = undef,
  Optional[String] $target  = "/etc/sysctl.d/${title}.conf",
){

  # herculesteam-augeasproviders_sysctl resource
  sysctl { $title:
    ensure  => $ensure,
    value   => $value,
    target  => $target,
    comment => $comment,
    persist => $persist,
    apply   => $apply,
    silent  => $silent,
  }

}
