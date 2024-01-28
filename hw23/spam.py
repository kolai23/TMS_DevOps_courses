import getpass, smtplib
from email.message import EmailMessage
import argparse
import time


parser = argparse.ArgumentParser(description='What the program does')
parser.add_argument("--from_address", help='Введите название пакета')
parser.add_argument("--to_address", help='Введите название пакета')
args = parser.parse_args()
from_address = args.from_address
to_address = args.to_address

print(from_address)
print(to_address)

msg = EmailMessage()
msg['Subject'] = f"{time.gmtime()}"
msg['From'] = from_address
msg['To'] = to_address 

with open( "mail.txt" , "r") as f:
    msg.set_content(f.read())

sender_address = input('Username: ')
sender_pass = getpass(prompt='Password: ', stream=None)

s = smtplib.SMTP('smtp.gmail.com', 587)
s.login(sender_address, sender_pass)
s.send_message(msg)
s.quit()
print('Mail Sent')