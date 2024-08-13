import paramiko
import time
import getpass



username = input('Username: ')
password = getpass.getpass('Password: ')

f = open("ip_list.txt", "r")

for line in f.readlines():
    ip = line.strip()           #remove other symbol
    ssh_client =  paramiko.SSHClient()
    ssh_client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    ssh_client.connect(hostname=ip, username=username, password=password, look_for_keys=False) 
    print ("Successfully connect to ", ip)
    command = ssh_client.invoke_shell()
    command.send("configure terminal\n")
    command.send("router eigrp 1 \n")
    time.sleep(0.5)
    command.send("end\n")
    command.send("wr mem\n")
    time.sleep(2)
    output = command.recv(65535).decode('ascii')
    print (output)

f.close()
ssh_client.close