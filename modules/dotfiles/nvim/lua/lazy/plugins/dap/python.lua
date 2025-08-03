return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/neotest-python",
	},
	ft = "python",
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
		ft = "python",
		config = function()
			require("dap-python").setup("python3")
		end,
	}
}
