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
		{ '<localleader>r', function() require("springboot-nvim").boot_run() end,           desc = "Spring Boot Run Project", ft = "java" },
		{ '<localleader>c', function() require("springboot-nvim").generate_class() end,     desc = "Java Create Class",       ft = "java" },
		{ '<localleader>i', function() require("springboot-nvim").generate_interface() end, desc = "Java Create Interface",   ft = "java" },
		{ '<localleader>e', function() require("springboot-nvim").generate_enum() end,      desc = "Java Create Enum",        ft = "java" },
	}
}
