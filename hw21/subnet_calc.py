#!/usr/bin/python
import sys
import argparse

def list_print(in_list):
    string = ''
    count =0
    for pr_list in in_list:
        string +=str(pr_list)
        count+=1
        if count <= 3:
            string+='.'
    return string

parser = argparse.ArgumentParser(prog='PROG', usage='%(prog)s [options]')
parser.add_argument ('--ip')
parser.add_argument ('--cidr_mask')
args = parser.parse_args()

address = args.ip.split('.')
mask_ip = args.cidr_mask.split('.')
host = []

for ad, mask in zip(address, mask_ip):
    host.append( int(ad) & int(mask) )

print("Адрес подсети: " + list_print(host))
print("Маска подсети: " + list_print(mask_ip))

host_one = [0, 0, 0, 1]
one_host_network = []

for ad, one_list in zip(host, host_one):
    one_host_network.append( int(ad) | int(one_list) )

print("IP адрес первого хоста: " + list_print(one_host_network))

host_latest = [255, 255, 255, 255]
inventory_mask = []

for ad, latest_list in zip(mask_ip, host_latest):
    inventory_mask.append( int(ad) ^ int(latest_list) )

latest_host_network = []

for ad, latest_list in zip(inventory_mask, one_host_network):
    latest_host_network.append( int(ad) ^ int(latest_list) )

print("IP адрес последнего хоста: " + list_print(latest_host_network))

brodcast_address = []
for ad, latest_list in zip(inventory_mask, host):
    brodcast_address.append( int(ad) ^ int(latest_list) )

print("Широковещательный адрес: " + list_print(brodcast_address))

def class_ip(size):
    if size == 0:
        return 'Весь интернет'
    elif 1 <= size <= 127:
        return 'Адрес класа А' 
    elif 128 <= size <= 191:
        return 'Адрес класа B'    
    elif 192 <= size <= 223:
        return 'Адрес класа C'     
    elif 224 <= size <= 239:
        return 'Адрес класа D'    
    elif 240 <= size <= 255:
        return 'Адрес класа E'
    else:
        return 'Адрес не существует'

print("Класс подсети: " + class_ip(host[0]))





