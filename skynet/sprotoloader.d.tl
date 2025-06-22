local sproto = require "skynet.sproto"

local record sprotoloader
	register: function(filename: string, index: integer)
	save: function(bin: string, index: integer)
	load: function(index: integer): sproto
end

return sprotoloader
