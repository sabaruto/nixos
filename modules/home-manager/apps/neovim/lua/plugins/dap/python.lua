return {
	{ "nvim-neotest/neotest-python" },
	{ "mfussenegger/nvim-dap-python" },
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/neotest-python",
	},
	opts = {
		adapters = {
			["neotest-python"] = ({
				runner = "pytest",
			})
		}
	},
	{
		"mfussenegger/nvim-dap-python",
		dependencies = {
			"mfussenegger/nvim-dap",
		},
		config = function()
			require("dap-python").setup("python3")
		end,
	}
}
