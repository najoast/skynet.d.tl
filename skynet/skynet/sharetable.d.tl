local record sharetable
	loadfile: function(filename:string, ...:any)
	loadstring: function(filename:string, source:string, ...:any)
	loadtable: function(filename:string, tbl:table)
	query: function(filename:string): nil|table
	queryall: function(filenamelist:{string}): {string:table}
	update: function(...:any)
end

return sharetable
