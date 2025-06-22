local record sockethelper
	record se
		metamethod __tostring: function(): string
		metamethod __call: function(self:se, into:string): se
	end

	type filedescriptor = integer

	socket_error: se
	readfunc: function(fd:filedescriptor, pre:string): string
	readall: function(id:integer): string
	writefunc: function(fd:filedescriptor): function(content:string)
	connect: function(host:string, port:integer, timeout:integer): filedescriptor
	close: function(fd:filedescriptor)
	shutdown: function(fd:filedescriptor)
end

return sockethelper
