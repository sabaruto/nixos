return {
	{
		"mfussenegger/nvim-dap",
		keys = function()
			local dap = require("dap")
			return {
				{ "<leader>tb", dap.toggle_breakpoint, desc = "Toggle Breakpoint" },
				{ "<leader>dc", dap.continue,          desc = "Continue" },
				{ "<leader>dq", dap.terminate,         desc = "Terminate Debugger" },
			}
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
		},
		config = function()
			local dapui = require("dapui")
			local dap = require("dap")

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
		end,
	}

}
