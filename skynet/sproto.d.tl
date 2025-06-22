
local record sproto
	enum RPC_TYPE
		"REQUEST"
		"RESPONSE"
	end

	record blob
		is userdata
	end

	type responser = function(args: table, ud: table): string

	record hostobj
		dispatch: function(self: hostobj, blob: string|blob, sz?: number): RPC_TYPE, string, string, responser|nil, table
		attach: function(self: hostobj, sp: sproto): function(name: string, args: table, session: number, ud: table): string
	end

	new: function(spbin: string): sproto
	sharenew: function(cobj: blob): sproto
	parse: function(schema: string): sproto
	exist_type: function(typename: string): boolean
	encode: function(typename: string, luatable: table): string
	decode: function(typename: string, blob: string|blob, sz?: number): table
	pencode: function(typename: string, luatable: table): string
	pdecode: function(typename: string, blob: string|blob, sz?: number): table
	default: function(typename: string, type?: RPC_TYPE): table
	host: function(self: sproto, packagename: string): hostobj
end

return sproto
