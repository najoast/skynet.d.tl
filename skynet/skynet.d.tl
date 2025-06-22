
local record skynet
	record rawmsg
		is userdata
	end

	type prototype = number
	-- service address
	type service_addr = number
	-- message session
	type session = number
	-- message packer
	type packer = function(...: any): rawmsg, number
	-- service message dispatcher
	type dispatcher = function(session: session, source: service_addr, ...: any)

	type unknown_request = function(session: session, source: service_addr, msg: rawmsg, sz: number, prototype: string)
	type unknown_response = function(session: session, source: service_addr, msg: rawmsg, sz: number)

	PTYPE_TEXT: prototype
	PTYPE_RESPONSE: prototype
	PTYPE_MULTICAST: prototype
	PTYPE_CLIENT: prototype
	PTYPE_SYSTEM: prototype
	PTYPE_HARBOR: prototype
	PTYPE_SOCKET: prototype
	PTYPE_ERROR: prototype
	PTYPE_QUEUE: prototype
	PTYPE_DEBUG: prototype
	PTYPE_LUA: prototype
	PTYPE_SNAX: prototype
	PTYPE_TRACE: prototype

	record protocol
		name: string
		id: number
		pack: function(...: any): string
		unpack: function(msg: string, sz: number): any...
		dispatch: dispatcher
	end

	register_protocol: function(class: protocol)

	trace_timeout: function(on: boolean)
	timeout: function(ti: number, func: function())
	sleep: function(ti: number, token: thread)
	yield: function()
	wait: function(token: thread)
	self: function(): service_addr
	localname: function(name: string): service_addr
	now: function(): number
	hpc: function(): number
	trace: function(info: string)
	tracetag: function(): string
	starttime: function(): number
	time: function(): number
	exit: function()
	getenv: function(key: string): string
	setenv: function(key: string, value: string)
	send: function(addr: service_addr, typename: string, ...: any): session
	rawsend: function(addr: service_addr, typename: string, msg: string, sz: number): session
	genid: function(): session
	redirect: function(dest: service_addr, source: service_addr, typename: string, ...: any): session
	pack: packer
	packstring: function(...: any): string
	unpack: function(msg: rawmsg|string, sz?: number): any...
	tostring: function(msg: rawmsg, sz: number): string
	trash: function(msg: string|rawmsg)

	call: function(addr: service_addr, typename: string, ...: any): any...
	rawcall: function(addr: service_addr, typename: string, msg: rawmsg, sz: number): any...
	tracecall: function(tag: string, addr: service_addr, typename: string, msg: rawmsg, sz: number): rawmsg, number

	ret: function(msg: string, sz: number): boolean
	context: function(): session, service_addr
	ignoreret: function()
	response: function(pack: packer): function(ok: boolean, ...: any): boolean
	retpack: function(...: any): boolean
	wakeup: function(token: thread): boolean|nil
	dispatch: function(typename: string, func: dispatcher): dispatcher|boolean
	dispatch_unknown_request: function(unknown: unknown_request): unknown_request
	dispatch_unknown_response: function(unknown: unknown_response): unknown_response
	dispatch_message: function(prototype: string, msg: rawmsg, sz: number, session: session, source: service_addr)
	fork: function(func: function(...: any), ...: any): thread

	newservice: function(name: string, ...: any): service_addr
	uniqueservice: function(global: boolean|string, ...: any): service_addr
	queryservice: function(global: boolean|string, ...: any): service_addr

	address: function(addr: service_addr): string
	harbor: function(addr: service_addr): number, boolean

	error: function(msg: string)
	tracelog: function(tag: string, user: string, co: thread|number, level?: number)
	traceproto: function(prototype: string, flag?: boolean)

	init: function(f: function())
	pcall: function(f: function(...:any):any...): boolean,string,any...
	init_service: function(start: function())
	start: function(start_func: function())
	endless: function(): boolean
	mqlen: function(): number
	stat: function(what: string): number
	task: function(ret: nil|string|table|number|thread): nil|number|string|session
	uniqtask: function(): {string:string}
	term: function(service: service_addr)
	memlimit: function(bytes: number)

	-- skynet.manager
	launch: function(servicename: string, ...: any): service_addr|nil
	kill: function(servicename: string)
	abort: function()
	register: function(name: string)
	name: function(name: string, handle: service_addr)
	forward_type: function(map: {prototype:prototype}, start_func: function())
	filter: function(filter: function(ptype:prototype, msg:rawmsg, sz:number, session:session, source:service_addr):(prototype,rawmsg,number,session,service_addr), start_func: function())
	monitor: function(servicename: string, query: boolean): service_addr
end

return skynet
