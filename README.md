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


## Usage


