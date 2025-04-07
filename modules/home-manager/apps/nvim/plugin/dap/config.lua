local wk = require("which-key")
local dap = require("dap")
local dapui = require("dapui")

dap.listeners.before.attach.dapui_config = function()
	dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
	dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
	dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
	dapui.close()
end

-- Take a look at https://github.com/mfussenegger/nvim-dap/blob/master/doc/dap.txt for more
-- information on good keybindings
wk.add({
	mode = { "n" },
	{
		{ "<leader>d",  group = "Debugging" },
		{ "<leader>dt", dap.toggle_breakpoint, desc = "Toggle Breakpoint" },
		{ "<leader>dc", dap.continue,          desc = "Continue" },
		{ "<leader>dq", dap.terminate,         desc = "Terminate Debugger" },
	},
})
