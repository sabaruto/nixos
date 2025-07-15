vim.g.createmapleader = function(name, keys)
	local mapname = "map" .. name .. "leader"
	vim.g[mapname] = keys
	return vim.g[mapname]
end

vim.g.remove_lsp_mapping = function(mode, lhs)
	local map_desc = vim.fn.maparg(lhs, mode, false, true).desc
	if map_desc == nil or string.find(map_desc, 'vim%.lsp') == nil then return end
	vim.keymap.del(mode, lhs)
end
