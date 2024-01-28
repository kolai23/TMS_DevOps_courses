import requests
import json 
import os, sys
import argparse

def list_package(package_name):
    if package_name is not None:
        r = requests.get(f'https://pypi.org/pypi/{package_name}/json')
        data = r.json()
        thislist = []

        for dist in data['info']['requires_dist']:
            thislist.append(dist)

        with open( "package.json" , "w") as write_file: 
            json.dump(thislist,write_file)

        print ("Файл создан")
    else:
        print ("Не заданы параметры выполнения скрипта")
    
parser = argparse.ArgumentParser(description='What the program does')
parser.add_argument("--package", help='Введите название пакета')
args = parser.parse_args()
package=args.package

if os.path.exists('package.json'):
    print ("Файл уже существует")
    record_input = input('Перезаписываем файл?(Y/N): ')
    if record_input.lower() == 'yes':
        list_package(package)
    elif record_input.lower() == 'no':
        exit()
    else:
        print('Ведите yes или no')
else:
    list_package(package)
    


