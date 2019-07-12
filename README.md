
# TINET: Tiny Network

**!!This is prototype version.!! UI may change without prior notice**

An instant virtual network on your laptop with light-weight virtualization.
Here we introduce the Container Network Simulation tools.
Users can generate,  from the YAML configuration file,
the script to build the L2 container network.
Quickstart guide is provided in [QUICKSTART.md](docs/QUICKSTART.md).
It is tested on Ubuntu 16.04 LTS and later.

## Setup and Usage

Prepare and install CNS like below.
You should install docker before following.
```
$ sudo apt install python3 python3-pip graphviz
$ git clone https://github.com/slankdev/tinet && cd tinet
$ sudo pip3 install -r requirement.txt
$ sudo cp bin/tn /usr/local/bin/tn
$ tn version
```

```
Usage:
  tn [-f <arg>...] [options] [COMMAND] [ARGS...]
  tn -h|--help

Options:
  --verbose             Generate verbose shell
  --dry-run             Print the recipes that are needed to execute the
                        targets up to date, but not actually execute them.
  --project-name NAME   Specify an alternate project name
                        (default: none)
  --H, --host HOST      Daemon socket to connect to

COMMAND:
  ps         List services
  start      Start services
  stop       Stop services
  create     Create services
  rm         Remove stopped containers
  up         Create and start containers
  down       Stop and remove containers
  pull       Pull service images
  exec       Execute a command in a running container
  build      Generate a Docker bundle from the spec file
  conf       Execute config-cmd in a running container
  reconf     Remove, create, start and config
  restart    Remove, create, start
  version    Show the tinet version information
  test       Execute tests
  init       Generate template spec file
  img        Generate topology png file
```

Running on VM
```
##XXX: if cns will be running on VM
$ sudo apt install linux-image-extra-virtual
```

## Author and Licence

This is just a hobby project. It does not relate to any activity of my company.
It is developed under the Apache License. Please refer to the `LICENCE`.

- Name: Hiroki Shirokura, IPA ICSCoE
- Email: slankdev [at] coe.ad.jp (replace [at] to @)

