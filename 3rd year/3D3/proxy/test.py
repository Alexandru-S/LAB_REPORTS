

httpd = make_server('',8005, hello_world)
print 'Serving on port 8005...'
httpd.serve_forever()
