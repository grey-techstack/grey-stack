import paramiko
import time
import getpass

username = input('Username: ')
password = getpass.getpass('password: ')

f = open("ip_list.txt")

for line in f.readlines():
    ip_address = line.strip()           #remove other symbol
    ssh_client =  paramiko.SSHClient()
    ssh_client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    ssh_client.connect(hostname=ip_address, username=username, password=password, look_for_keys=False) 
    print ("Successfully connect to ", ip_address)
    command = ssh_client.invoke_shell()
    command.send("configure terminal\n")
    command.send("ip ftp username python\n")
    command.send("ip ftp password python\n")
    command.send("file prompt quiet\n")
    command.send("end\n")
    command.send("copy running-config ftp://192.168.2.3\n")
    time.sleep(5)
    output = command.recv(65535).decode('ascii')
    print (output)

    f.close()
    ssh_client.close