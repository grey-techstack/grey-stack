from netmiko import ConnectHandler

SW2 = {
    'device_type': 'cisco_ios',
    'ip': '192.168.2.12',
    'username': 'python',
    'password': '123'
}

connect = ConnectHandler(**SW2)                                                 #use created dictionary to SSH
print ("Successfully connect to " + SW2['ip'])                                  #SW2 dictionary's IP,[] use to get value from dictionary
config_commands = ['int loop 1', 'ip address 2.2.2.2 255.255.255.0']            #create list
output = connect.send_config_set(config_commands)                               #send_config_sets=ConnectHandler's function,to configure ciso
print (output)
result = connect.send_command('show run int loop 1')                            #send_command only 1 command, send_config_sets=multi command
print (result)


