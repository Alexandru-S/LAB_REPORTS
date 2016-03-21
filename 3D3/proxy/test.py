from wsgiref.simple_server import make_server

def hello_world(environ, start_response):
	status = '200 ok'
	headers = [('Content-type ','text/plain ')]
	start_response(status, headers)
	
	return ['Access Restricted']
	
httpd = make_server('',8005, hello_world)
print 'Serving on port 8005...'
httpd.serve_forever()
