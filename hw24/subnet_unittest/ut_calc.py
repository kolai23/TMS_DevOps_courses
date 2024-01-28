#!/usr/bin/python3
import subnet_calc as gs
import unittest

class Test_Subnet_calc(unittest.TestCase):

    def test_get_ip_address(self):
        address = '192.168.10.1'.split('.')
        mask_ip = '255.255.255.0'.split('.')
        net = gs.Get_Subnet_calc( address, mask_ip)


        self.assertEqual(net.get_ip_address(),'192.168.10.1')
        self.assertEqual(net.get_ip_mask(),'255.255.255.0')  
        
        net.ip_subnet()
        self.assertEqual(net.get_ip_subnet(),'192.168.10.0')
    
        net.one_host_net()
        self.assertEqual(net.get_one_host_net(),'192.168.10.1')

        net.end_host_net()
        self.assertEqual(net.get_end_host_net(),'192.168.10.254')

        net.brodcast()
        self.assertEqual(net.get_brodcast(),'192.168.10.255')

if __name__ == '__main__':
    unittest.main()