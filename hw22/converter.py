#!/usr/bin/python3
import xmltodict,json,yaml
import sys
import argparse

class Convert:
    def __init__(self, in_type, out_type, in_file_name):
        self.in_format = in_type
        self.out_format = out_type 
        self.data = None
        self.in_file_name = in_file_name

    def Display_Info(self):
            print(f"in_format: {self.in_format}  out_formatge: {self.out_format} out_formatge: {self.data}")

    def ReadStdIn(self):
        read_in=sys.stdin.read()
        if self.in_format == 'yaml':
            self.data =  yaml.load(read_in)
            return self.data
        elif self.in_format == 'json':
            self.data = json.loads(read_in)
            return self.data
        elif self.in_format == 'xml':
            self.data = xmltodict.parse(read_in)
            return self.data
        else:
            print("Введите --in_format")

    def ReadDataFile(self):
        if self.in_format == 'yaml':
            with open(self.in_file_name, 'r') as f:
                self.data =  yaml.safe_load(f)
                return self.data
        elif self.in_format == 'json':
            with open(self.in_file_name, 'r') as f:
                self.data = json.load(f)
                return self.data
        elif self.in_format == 'xml':
            with open(self.in_file_name, 'r') as f:
                data_xml = f.read()
                self.data = xmltodict.parse(data_xml)
                return self.data
        else:
            print("Введите --out_format")

    def ConvertFile(self):
        if self.out_format == 'json':
            with open('data_convert.json', 'w') as f:
                json.dump(self.data,f)
        elif self.out_format == 'yaml':
            with open('data_convert.yaml', 'w') as f:
                yaml.dump(self.data,f)
        elif self.out_format == 'xml':
            with open('data_convert.xml', 'w') as f:
                xml_file = xmltodict.unparse(self.data)
                f.write(xml_file)
        else:
            print("Введите --out_format")

if __name__ == '__main__':

    parser = argparse.ArgumentParser(description='What the program does')
    parser.add_argument("--in_format", help='Введите название пакета')
    parser.add_argument("--out_format", help='Введите название пакета')
    parser.add_argument("--in_file", help='Введите название пакета')
    args = parser.parse_args()
    in_format = args.in_format
    out_format = args.out_format
    in_file = args.in_file
    
    if in_file == None:
        file_obj_read = Convert(in_format,out_format,in_file_name=None)
        file_obj_read.ReadStdIn()
        file_obj_read.ConvertFile()
    else:
        file_obj_in = Convert(in_format,out_format,in_file_name=in_file)
        file_obj_in.ReadDataFile()
        file_obj_in.ConvertFile()





