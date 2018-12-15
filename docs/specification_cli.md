
# Commandline Options

This is version 0.0 tinet's cli interface.
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

## Options

### --verbose

```
# cat spec.yaml
services:
  - name: N0
    image: ubuntu:18.04
configs:
  - name: N0
    cmds:
     - cmd: echo slankdev

# tn conf
[N0::config] ... done

# tn conf --verbose
[N0::config] ... 
slankdev
done
```

### --dry-run

dry-run option make just shell script only, 
this command isn't execute nothing.

```
# cat spec.yaml
services:
  - name: N0
    image: ubuntu:18.04
    interfaces: [ { name: net0, type: direct, args: N1#net0 } ]
  - name: N1
    image: ubuntu:18.04
    interfaces: [ { name: net0, type: direct, args: N0#net0 } ]
configs:
  - name: N0
    cmds: [ { cmd: ip addr add 10.0.0.10/24 dev net0 } ]
  - name: N1
    cmds: [ { cmd: ip addr add 10.0.0.11/24 dev net0 } ]

# tn up --dry-run
tn_up_e800e2b1a0e4 () {
	docker run -td --hostname N0 --name N0 --rm --privileged ubuntu:18.04
	docker run -td --hostname N1 --name N1 --rm --privileged ubuntu:18.04
	mount_docker_netns N0 N0
	mount_docker_netns N1 N1
	ip link add net0 netns N0 type veth peer name net0 netns N1
	ip netns exec N0 ip link set net0 up
	ip netns exec N1 ip link set net0 up
	ip netns del N0
	ip netns del N1
}
tn_up_e800e2b1a0e4

# tn conf --dry-run
tn_up_e800e2b1a0e4 () {
	docker exec -it N0 ip addr add 10.0.0.10/24 dev net0
	docker exec -it N1 ip addr add 10.0.0.11/24 dev net0
}
tn_up_e800e2b1a0e4

# tn reconf --dry-run
tn_down_e800e2b1a0e4 () { ... }
tn_up_e800e2b1a0e4 () { ... }
tn_conf_e800e2b1a0e4 () { ... }
tn_down_e800e2b1a0e4
tn_up_e800e2b1a0e4
tn_conf_e800e2b1a0e4
```

## conf

```
# cat spec.yaml
services:
  - name: N0
    image: ubuntu:18.04
    interfaces: [ { name: net0, type: direct, args: N1#net0 } ]
  - name: N1
    image: ubuntu:18.04
    interfaces: [ { name: net0, type: direct, args: N0#net0 } ]
configs:
  - name: N0
    cmds: [ { cmd: ip addr add 10.0.0.10/24 dev net0 } ]
  - name: N1
    cmds: [ { cmd: ip addr add 10.0.0.11/24 dev net0 } ]
# tn conf 
```

## test

```
# cat spec.yaml
test:
  - name: p2p
    cmds:
    - cmd: docker exec S0 ping -c2 10.1.0.1
    - cmd: docker exec S1 ping -c2 192.168.0.1
    - cmd: docker exec S2 ping -c2 192.168.0.1
    - cmd: docker exec S3 ping -c2 192.168.0.1
  - name: remote
    cmds:
    - cmd: docker exec S0 ping -c2 10.1.0.1
    - cmd: docker exec S1 ping -c2 192.168.0.1
    - cmd: docker exec S2 ping -c2 192.168.0.1
    - cmd: docker exec S3 ping -c2 192.168.0.1

# tn test p2p
# tn test remote
# tn test -a      // execute all tests
```
