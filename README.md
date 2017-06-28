My conky setup
==============

## conky_update.sh

### USAGE 

```bash
conky_update.sh [<config>]
```

### DESCRIPTION
A script that updates the conky setup to the latest git version, from this repo.

### OPTIONS

```
  config - Force creation of config file at specified location
```

### EXAMPLES

```bash
  # Force creating the default config
  conky_update.sh ${HOME}/.config/conky/conky.conf
```

## conky_vpn.sh

### USAGE

```bash
conky_vpn.sh
```

### DESCRIPTION
An example script that checks for any active VPN connections and tries to characterize them.
