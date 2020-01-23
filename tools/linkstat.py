#!/usr/bin/env python
import argparse
import os, sys


def int_cat(file_name):
  f = open(file_name)
  data = f.read()
  return int(data)


def show_link_stats(links):
  print('{:<10}  {:<20}  {:<20}'.format('link', 'rx_packets', 'tx_packets'))
  print('{:-<10}  {:-<20}  {:-<20}'.format('', '', ''))
  for link in links:
    base = '/sys/class/net/{}/statistics'.format(link)
    rx_packets = int_cat('{}/rx_packets'.format(base))
    tx_packets = int_cat('{}/tx_packets'.format(base))
    print('{:<10}  {:<20}  {:<20}'.format(link, rx_packets, tx_packets))


def get_all_interfaces_name():
  links = []
  for link in os.listdir('/sys/class/net'):
    base = '/sys/class/net/{}'.format(link)
    if os.path.islink(base):
      links.append(link)
  return links


def main():
  parser = argparse.ArgumentParser()
  parser.add_argument('--version', '-v', action='version',
      version='%(prog)s v2019.09.12 copyright slankdev')
  parser.add_argument('--interfaces', '-i', default='any')
  args = parser.parse_args()
  if args.interfaces == 'any': show_link_stats(get_all_interfaces_name())
  else: show_link_stats(args.interfaces.split(','))


if __name__ == '__main__': main()
