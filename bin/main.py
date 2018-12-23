#!/usr/bin/env python3

import sys
import getopt
import argparse
import pprint
import pydot
import yaml

usage_text='''
  tn [-f <arg>...] [options] [COMMAND] [ARGS...]
  tn -h|--help

Options:
  -f --specfile NAME    Specify specification yaml file
  -v, --verbose         Generate verbose shell
  --dry-run             Print the recipes that are needed to execute the
                        targets up to date, but not actually execute them.
  --project-name NAME   Specify an alternate project name
                        (default: none)
  --host HOST           Daemon socket to connect to

COMMAND:
  ps         List services
  up         Create and start containers
  down       Stop and remove containers
  pull       Pull service images
  exec       Execute a command in a running container
  build      Generate a Docker bundle from the spec file
  conf       Execute config-cmd in a running container
  reconf     Stop, remove, create, start and config
  reup       Stop, remove, create and start
  version    Show the tinet version information
  test       Execute tests
  init       Generate template spec file
  img        Generate topology png file
'''

def command_exec(args):
    print('command_exec')
    print(args)

def command_conf(args):
    print('command_conf')
    print(args)

def main():
    parser = argparse.ArgumentParser(
      formatter_class=argparse.RawTextHelpFormatter)
    parser.add_argument('-f', '--specfile', default='spec.yaml')
    parser.add_argument('-H', '--host', default=None)
    parser.add_argument('--project-name', default='')
    parser.add_argument('--verbose', action='store_true')

    subparsers = parser.add_subparsers(dest='command')
    subparsers.required = True

    exec_parser = subparsers.add_parser('exec', help='see add exec')
    exec_parser.add_argument('target')
    exec_parser.set_defaults(func=command_exec)

    exec_parser = subparsers.add_parser('conf', help='see add conf')
    exec_parser.set_defaults(func=command_conf)

    args = parser.parse_args()
    args.func(args)

main()
