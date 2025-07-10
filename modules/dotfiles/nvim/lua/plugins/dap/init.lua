return {
	{
		"mfussenegger/nvim-dap",
		keys = function()
			local dap = require("dap")
			return {
				{ "<leader>tb", dap.toggle_breakpoint,                                                     desc = "Toggle Breakpoint" },
				{ "<leader>dc", dap.continue,                                                              desc = "Continue" },
				{ "<leader>dq", dap.terminate,                                                             desc = "Terminate Debugger" },
				{ "<leader>dB", function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
				{ "<leader>db", function() dap.toggle_breakpoint() end,                                    desc = "Toggle Breakpoint" },
				{ "<leader>dc", function() dap.continue() end,                                             desc = "Run/Continue" },
				{ "<leader>da", function() dap.continue({ before = get_args }) end,                        desc = "Run with Args" },
				{ "<leader>dC", function() dap.run_to_cursor() end,                                        desc = "Run to Cursor" },
				{ "<leader>dg", function() dap.goto_() end,                                                desc = "Go to Line (No Execute)" },
				{ "<leader>di", function() dap.step_into() end,                                            desc = "Step Into" },
				{ "<leader>dj", function() dap.down() end,                                                 desc = "Down" },
				{ "<leader>dk", function() dap.up() end,                                                   desc = "Up" },
				{ "<leader>dl", function() dap.run_last() end,                                             desc = "Run Last" },
				{ "<leader>do", function() dap.step_out() end,                                             desc = "Step Out" },
				{ "<leader>dO", function() dap.step_over() end,                                            desc = "Step Over" },
				{ "<leader>dP", function() dap.pause() end,                                                desc = "Pause" },
				{ "<leader>dr", function() dap.repl.toggle() end,                                          desc = "Toggle REPL" },
				{ "<leader>ds", function() dap.session() end,                                              desc = "Session" },
				{ "<leader>dt", function() dap.terminate() end,                                            desc = "Terminate" },
				{ "<leader>dw", function() require("dap.ui.widgets").hover() end,                          desc = "Widgets" },
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

			local vscode = require("dap.ext.vscode")
			local json = require("plenary.json")
			vscode.json_decode = function(str)
				return vim.json.decode(json.json_strip_comments(str))
			end
		end,
	}

}
