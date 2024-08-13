import os
hostname = 'www.cisco.com'
response = os.system("ping -c 5 " + hostname)   #os.system返回整數，0=reach
if response == 0:
    print (hostname + ' is reachable.')
else:
    print (hostname + ' is not reachable.')