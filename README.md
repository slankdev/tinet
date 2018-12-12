
# CNS: Container Network Simulation tools

Here we introduce the Container Network Simulation tools.
Users can generate,  from the YAML configuration file,
the script to build the L2 container network.
Quickstart guide is provided in [QUICKSTART.md](QUICKSTART.md).
It is tested on Ubuntu 16.04 LTS and later.

## Setup and Usage

Prepare and install CNS like below.
```
$ sudo apt install graphviz  # for cns img
$ git clone https://github.com/slankdev/cns && cd cns
$ sudo pip3 install -r requirement.txt
$ sudo cp bin/cns /usr/local/bin
```

Usage:
```
$ cd <working_dir>
$ cns                  // show usage
$ cns -h               // show help
$ cns init             // generate init shell-script to stdout
$ cns fini             // generate fini shell-script to stdout
$ cns init | sudo sh   // generate and execute init shell-script
$ cns fini | sudo sh   // generate and execute fnit shell-script
$ cns conf | sudo sh   // generate and execute config shell-script
$ cns tpl              // generate template
$ cns img              // generate network topology image file
```

Running on VM
```
##XXX: if cns will be running on VM
$ sudo apt install linux-image-extra-virtual
```

## Author and Licence

This is just a hobby project. It does not relate to any activity of my company.
It is developed under the Apache License. Please refer to the `LICENCE`.

- Name: Hiroki Shirokura
- Company: NTT Communications, Tech-Dev Division
- Email: slankdev [at] nttv6.jp (replace [at] to @)

