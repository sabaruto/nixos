return {
	{
		"mfussenegger/nvim-dap",
		config = function(_, _)
			local dap = require("dap")

			vim.keymap.set({ "n", "x" }, "<leader>Tb", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
			vim.keymap.set({ "n", "x" }, "<leader>dc", dap.continue, { desc = "Continue" })
			vim.keymap.set({ "n", "x" }, "<leader>dq", dap.terminate, { desc = "Terminate Debugger" })
			vim.keymap.set({ "n", "x" }, "<leader>dB", function()
				dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end, { desc = "Breakpoint Condition" })
			vim.keymap.set({ "n", "x" }, "<leader>db", function()
				dap.toggle_breakpoint()
			end, { desc = "Toggle Breakpoint" })
			vim.keymap.set({ "n", "x" }, "<leader>dc", function()
				dap.continue()
			end, { desc = "Run/Continue" })
			vim.keymap.set({ "n", "x" }, "<leader>da", function()
				dap.continue({ before = get_args })
			end, { desc = "Run with Args" })
			vim.keymap.set({ "n", "x" }, "<leader>dC", function()
				dap.run_to_cursor()
			end, { desc = "Run to Cursor" })
			vim.keymap.set({ "n", "x" }, "<leader>dg", function()
				dap.goto_()
			end, { desc = "Go to Line (No Execute)" })
			vim.keymap.set({ "n", "x" }, "<leader>di", function()
				dap.step_into()
			end, { desc = "Step Into" })
			vim.keymap.set({ "n", "x" }, "<leader>dj", function()
				dap.down()
			end, { desc = "Down" })
			vim.keymap.set({ "n", "x" }, "<leader>dk", function()
				dap.up()
			end, { desc = "Up" })
			vim.keymap.set({ "n", "x" }, "<leader>dl", function()
				dap.run_last()
			end, { desc = "Run Last" })
			vim.keymap.set({ "n", "x" }, "<leader>do", function()
				dap.step_out()
			end, { desc = "Step Out" })
			vim.keymap.set({ "n", "x" }, "<leader>dO", function()
				dap.step_over()
			end, { desc = "Step Over" })
			vim.keymap.set({ "n", "x" }, "<leader>dP", function()
				dap.pause()
			end, { desc = "Pause" })
			vim.keymap.set({ "n", "x" }, "<leader>dr", function()
				dap.repl.toggle()
			end, { desc = "Toggle REPL" })
			vim.keymap.set({ "n", "x" }, "<leader>ds", function()
				dap.session()
			end, { desc = "Session" })
			vim.keymap.set({ "n", "x" }, "<leader>dt", function()
				dap.terminate()
			end, { desc = "Terminate" })
			vim.keymap.set({ "n", "x" }, "<leader>dw", function()
				require("dap.ui.widgets").hover()
			end, { desc = "Widgets" })
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		enabled = false,
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
		},
		config = function(_, opts)
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
			dapui.setup(opts)
		end,
	},
}
