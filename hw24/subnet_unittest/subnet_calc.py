#!/usr/bin/python3
import sys
import argparse
import unittest

class Subnet_calc:
    def __init__(self, ip, cidr_mask):
        self.address = ip
        self.mask_ip = cidr_mask 
        self.host = []
        self.one_host_network = []
        self.inventory_mask = []
        self.latest_host_network = []
        self.brodcast_address = []


    def ip_subnet(self):
        for ad, mask in zip(self.address, self.mask_ip):
            self.host.append( int(ad) & int(mask) )
        return self.host

    def mask_subnet(self):
        return self.mask_ip

    def one_host_net(self):
        host_one = [0, 0, 0, 1]
        for ad, one_list in zip(self.host, host_one):
            self.one_host_network.append( int(ad) | int(one_list) )
        return self.one_host_network
    
    def end_host_net(self):
        host_latest = [255, 255, 255, 255]
        for ad, latest_list in zip(self.mask_ip, host_latest):
            self.inventory_mask.append( int(ad) ^ int(latest_list) )

        for ad, latest_list in zip(self.inventory_mask, self.one_host_network):
            self.latest_host_network.append( int(ad) ^ int(latest_list) )
        return self.latest_host_network

    def brodcast(self):
        host_latest = [255, 255, 255, 255]
        for ad, latest_list in zip(self.mask_ip, host_latest):
            self.inventory_mask.append( int(ad) ^ int(latest_list) )

        for ad, latest_list in zip(self.inventory_mask, self.host):
            self.brodcast_address.append( int(ad) ^ int(latest_list) )

        return self.brodcast_address
    
    def class_ip(self):
        size = self.host[0]
        if size == 0:
            return 'Весь интернет'
        elif 1 <= size <= 127:
            return 'Адрес класcа А' 
        elif 128 <= size <= 191:
            return 'Адрес класcа B'    
        elif 192 <= size <= 223:
            return 'Адрес класcа C'     
        elif 224 <= size <= 239:
            return 'Адрес класcа D'    
        elif 240 <= size <= 255:
            return 'Адрес класcа E'
        else:
            return 'Адрес не существует'
        
def list_print(in_list):
    string = ''
    count =0
    for pr_list in in_list:
        string +=str(pr_list)
        count+=1
        if count <= 3:
            string+='.'
    return string


class Get_Subnet_calc(Subnet_calc):
    def __init__(self, ip, cidr_mask):
        super().__init__(ip,cidr_mask)
    
    def get_ip_address(self):
        return list_print(self.address)

    def get_ip_mask(self):
        return list_print(self.mask_ip)    
        
    def get_ip_subnet(self):
        return list_print(self.host)
    
    def get_one_host_net(self):
        return list_print(self.one_host_network)

    def get_end_host_net(self):
        return list_print(self.latest_host_network)

    def get_brodcast(self):
        return list_print(self.brodcast_address)

if __name__ == '__main__':

    parser = argparse.ArgumentParser(prog='PROG', usage='%(prog)s [options]')
    parser.add_argument ('--ip')
    parser.add_argument ('--cidr_mask')
    args = parser.parse_args()

    address = args.ip.split('.')
    mask_ip = args.cidr_mask.split('.')

    net = Get_Subnet_calc(address,mask_ip)

    print("Адрес IP: " + net.get_ip_address())
    print("Маска подсети: " + net.get_ip_mask())
    net.ip_subnet()
    print("Адрес подсети: " + net.get_ip_subnet())
    net.one_host_net()
    print("IP адрес первого хоста: " + net.get_one_host_net())
    net.end_host_net()
    print("IP адрес последнего хоста: " + net.get_end_host_net() )
    net.brodcast()
    print("Широковещательный адрес: " + net.get_brodcast())
    print("Класс подсети: " + net.class_ip())
