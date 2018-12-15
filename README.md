
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
$ sudo cp bin/tn /usr/local/tn
$ tn version
```

Usage:
```
$ cd <working_dir>
$ tn                  // show usage
$ tn -h               // show help
$ tn init             // generate init shell-script to stdout
$ tn fini             // generate fini shell-script to stdout
$ tn init | sudo sh   // generate and execute init shell-script
$ tn fini | sudo sh   // generate and execute fnit shell-script
$ tn conf | sudo sh   // generate and execute config shell-script
$ tn tpl              // generate template
$ tn img              // generate network topology image file
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

