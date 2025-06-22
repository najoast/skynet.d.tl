local record httpd
	read_request: function(readbytes:function(), bodylimit?:integer): integer|nil, string|integer, string, table, string
	write_response: function(writefunc:function(text:string), statuscode:integer, body:string|function(), header:table): boolean
end

return httpd
