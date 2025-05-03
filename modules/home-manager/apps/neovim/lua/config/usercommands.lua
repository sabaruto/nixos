vim.g.createmapleader = function(name, keys)
	local mapname = "map" .. name .. "leader"
	vim.g[mapname] = keys
	return vim.g[mapname]
end
