import paramiko
import time

ip = '192.168.2.11'
username = 'python'
password = '123'

ssh_client = paramiko.SSHClient()                                   #call paramiko.SSHClient and pass to ssh_client
ssh_client.set_missing_host_key_policy(paramiko.AutoAddPolicy())    #must have for paramiko
ssh_client.connect(hostname=ip, username=username, password=password, look_for_keys=False)      #look_for_keys to avoid using key to login SW
command = ssh_client.invoke_shell()                                 #call shell

print ('已经成功登陆交换机' + ip)

command.send('configure terminal\n')
command.send('interface loop 0\n')
command.send('ip add 1.1.1.1 255.255.255.255\n')
command.send('end\n')
command.send('wr mem\n')
time.sleep(5)

output = command.recv(65535).decode('ascii')            #recv to show command output,if not using ASCII will return string only and no \n
print (output)

ssh_client.close