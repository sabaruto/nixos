return {
	{
		"ray-x/mkdn.nvim",
		opts = {
			follow_link = "gx", -- keymap to follow link set to false to disable
			paste_link = "<localleader>p", -- keymap to fetch and paste url title
			templates = {
				-- see below: templates setup
			},
			notes_root = "~/notes", -- default note root
			assets_path = "assets", -- default assets path to store images, a subfolder of notes_root
			author = os.getenv("USER"), -- default author
		},
		ft = { "markdown" },
	},
}
