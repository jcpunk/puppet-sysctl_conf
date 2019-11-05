# Puppet sysctl_conf

A Hiera based `sysctl.conf` management.

## Description

By default for each key (e.g. `net.ipv4.ip_forward`) creates a corresponding configuration file (e.g. `/etc/sysctl.d/net.ipv4.ip_forward.conf`) with given value (`net.ipv4.ip_forward = 1`). `sysctl` configuration is applied immediately.

```yaml
sysctl_conf::values:
  net.ipv4.ip_forward:
    value: '1'
```

## Setup

Either include `sysctl_conf` directly in your node's definition:

```puppet
include sysctl_conf
```
or via Hiera call, e.g.:
```puppet
lookup('classes', {merge => unique}).include
```
then make sure to include `sysctl_conf` in `classes` definition:
```
```yaml
classes:
  - sysctl_conf
```

### Merge behavior

Cofigure suitable [merge behavior](https://puppet.com/docs/puppet/latest/hiera_merging.html) for you needs:

```yaml
lookup_options:
  sysctl_conf::values:
    merge: deep
```

## Usage

- set simple value:
```yaml
sysctl_conf::values:
  vm.overcommit_memory:
    value: '1'
```

- ignore non-activated configuration option
```yaml
sysctl_conf::values:
  "net.ipv6.conf.%{networking.primary}.disable_ipv6":
    value: '1'
    silent: true
```

- delete entry
```yaml
sysctl_conf::values:
  kernel.keys.root_maxkeys:
    ensure: absent
```

- don't persist configuration on disk
```yaml
sysctl_conf::values:
  net.ipv6.conf.all.disable_ipv6:
    value: '1'
    persist: false
```
- add comment
```yaml
sysctl_conf::values:
  vm.swappiness:
    value: '0'
    comment: 'disable swap'
```

- don't apply changes with `sysctl` command (will be applied upon next reboot)
```yaml
sysctl_conf::values:
  kernel.sem:
    value: '250 32000 256 256'
    apply: false
```
- custom configuration file
```yaml
net.ipv4.ip_forward:
  kernel.sem:
    value: '1'
    target: '/etc/sysctl.d/forwarding.conf'
```

## Documentation

Generate documentation in Markdown:
```
mkdir -p doc; puppet strings generate --format markdown --out doc/sysctl_conf.md
```
