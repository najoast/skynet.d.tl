
local record websocket
	enum handle_type
		"connect"
		"close"
		"handshake"
		"ping"
		"pong"
		"message"
		"error"
		"warning"
	end

	enum mode
		"server"
		"client"
	end

	enum protocol
		"ws"
		"wss"
	end

	enum write_fmt
		"text"
		"binary"
	end

	type socket_id = integer
	type handler = function(id:socket_id, ...:any)
	type handlers = {handle_type:handler}

	record wsobj
		id: socket_id
		mode: mode
		handle: handlers
		guid: string
		addr: string
		real_ip: string

		close: function()
		read: function(size:integer):string
		write: function(content:string)
	end

	accept: function(id:socket_id, handle:handlers, protocol:protocol, addr:string, options:table): boolean, string|nil
	connect: function(url:string, header:table, timeout:integer): socket_id
	read: function(id:socket_id): boolean|string, nil|string
	write: function(id:socket_id, data:string, fmt:write_fmt, masking_key:integer)
	ping: function(id:socket_id)
	addrinfo: function(id:socket_id):string
	real_ip: function(id:socket_id):string
	close: function(id:socket_id, code:integer, reason:string)
	is_close: function(id:socket_id):boolean
end

return websocket