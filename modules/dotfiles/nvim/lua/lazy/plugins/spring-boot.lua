return {
	"elmcgill/springboot-nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"mfussenegger/nvim-jdtls"
	},
	opts = {},
	config = function(_, _)
		vim.keymap.set("n", '<localleader>r', function() require("springboot-nvim").boot_run() end,
			{ desc = "Spring Boot Run Project", buffer = true })
		vim.keymap.set("n", '<localleader>c', function() require("springboot-nvim").generate_class() end,
			{ desc = "Java Create Class", buffer = true })
		vim.keymap.set("n", '<localleader>i', function() require("springboot-nvim").generate_interface() end,
			{ desc = "Java Create Interface", buffer = true })
		vim.keymap.set("n", '<localleader>e', function() require("springboot-nvim").generate_enum() end,
			{ desc = "Java Create Enum", buffer = true })
		return true
	end,
	ft = { "java" },
}
