import re
import httplib
import string
import sys
import socket
import os
import errno
import webbrowser
from wsgiref.simple_server import make_server
from socket import *
from urlparse import urlparse

proxyServerPort = 8000

proxyServerSocket = socket(AF_INET,SOCK_STREAM)
proxyServerSocket.bind(('localhost', proxyServerPort))
proxyServerSocket.listen(1)
print 'The proxy server is ready to receive'
r = "http://glassbyte.com/_include/css/bootstrap.min.css" , "glassbyte.com"
#proxy#
while 1:
        connectionSocket, addr = proxyServerSocket.accept()
        requestData = connectionSocket.recv(1024)
	#print requestData

	# Match Regular Expression
	url = re.search("(?P<url>http?://[^\s]+)", requestData).group("url")
	#print url
	print url
	
	if url in r:
		f = open('helloworld.html','w')

		message = """<html>
		<head></head>
		<body><p>Hello World!</p></body>
		</html>"""

		f.write(message)
		f.close()
		filename = 'helloworld.html'
		webbrowser.open_new_tab(filename)
		
		
		
		
		
	else:	
		# Parse HTTP Request
		output = urlparse(url)
		# Pass on HTTP Request to real web server
		conn = httplib.HTTPConnection(output.netloc)
		conn.request("GET", output.path)
		r1 = conn.getresponse()
		#print(r1.status, r1.reason)

		data1 = r1.read()
		#print data1
		for x in range(0,1):
			y=str(x)
			path = url
			#img_alt = os.path.basename(img_alt)
			if not os.path.exists(path):
    				os.makedirs(path)
			filename = y + '.txt'
			with open(os.path.join(path, filename), 'a') as temp_file:
    				temp_file.write(data1)
			temp_file.close()
	
		connectionSocket.send(data1)
		print ('---file has been writen to---')
        	connectionSocket.close()
        	print 'Connection has ended'
