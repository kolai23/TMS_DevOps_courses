#!/usr/bin/python3
import xmltodict,json,yaml
from jsonpath_ng import jsonpath, parse
import xml.etree.ElementTree as ET
import sys
import argparse
from lxml import etree

class Convert:
    def __init__(self, in_type, path):
        self.in_format = in_type
        self.in_path = path 
        self.data = None

    def Display_Info(self):
            print(f"in_format: {self.in_format}  out_formatge: {self.in_path} out_formatge: {self.data}")

    def ReadStdIn(self):
        read_in=sys.stdin.read()
        path_list = self.in_path.split("/")
        try:
            root = etree.fromstring(read_in)
            para = root.xpath(self.in_path)
            print (etree.tostring(para))
            for e in para:
                if not e.text:
                    text = "None"
                else:
                    text = e.text
                    print(text)
                
        except Exception as e:
            print(f"Error: {e}")
            return None


if __name__ == '__main__':

    parser = argparse.ArgumentParser(description='What the program does')
    parser.add_argument("--in_format", help='Введите название пакета')
    parser.add_argument("--path", help='Введите название пакета')
    args = parser.parse_args()
    in_format = args.in_format
    in_path = args.path

    file_obj_read = Convert(in_format,in_path)
    file_obj_read.ReadStdIn()

