require("java").setup({
	jdtls = {
		version = "v1.46.1",
	},
	jdk = {
		auto_install = false,
		version = "24.0.2",
	},
	java_test = {
		enable = true,
		version = "0.43.1",
	},

	spring_boot_tools = {
		enable = true,
		version = "1.59.0",
	},
})
