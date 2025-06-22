local record httpc
	record httpc_interface
		init: nil|function
		close: nil|function()
		read: function(size:integer): string
		write: function(content:string)
		readall: function(): string
		finish: boolean
	end

	record stream
		status: integer
		_body: string
		_interface: httpc_interface
		_reading: function(stream:stream): string|nil
		header: table
		connected: boolean

		close: function(self:stream)
		padding: function(self:stream): string|nil, stream

		metamethod __close: function(self:stream)
		metamethod __call: function(self:stream): string|nil, stream
	end

	timeout: integer
	dns: function(server:string, port:integer)
	request: function(method:string, hostname:string, url:string, recvheader:table, header:table, content:string): integer, string
	head: function(hostname:string, url:string, recvheader:table, header:table, content:string): integer
	request_stream: function(method:string, hostname:string, url:string, recvheader:table, header:table, content:string): stream
	-- get: function(hostname:string, url:string, recvheader:table, header?:table, content?:string): integer, string
	get: function(...:any): integer, string
	post: function(hostname:string, url:string, form:table, recvheader:table): integer, string
end

return httpc
