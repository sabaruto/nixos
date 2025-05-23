return {
	"elmcgill/springboot-nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"mfussenegger/nvim-jdtls"
	},
	opts = {},
	config = true,
	ft = { "java" },
	keys = {
		{ '<leader>Jr', function() require("springboot-nvim").boot_run() end,           desc = "Spring Boot Run Project" },
		{ '<leader>Jc', function() require("springboot-nvim").generate_class() end,     desc = "Java Create Class" },
		{ '<leader>Ji', function() require("springboot-nvim").generate_interface() end, desc = "Java Create Interface" },
		{ '<leader>Je', function() require("springboot-nvim").generate_enum() end,      desc = "Java Create Enum" },
	}
}
