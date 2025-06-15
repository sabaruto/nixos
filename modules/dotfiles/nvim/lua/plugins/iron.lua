return {
	{
		'Vigemus/iron.nvim',
		opts = {
			keymaps = {
				toggle_repl = "<localleader>rr", -- toggles the repl open and closed.
				-- If repl_open_command is a table as above, then the following keymaps are
				-- available
				-- toggle_repl_with_cmd_1 = "<localleader>rv",
				-- toggle_repl_with_cmd_2 = "<localleader>rh",
				restart_repl = "<localleader>rR", -- calls `IronRestart` to restart the repl
				send_motion = "<localleader>sc",
				visual_send = "<localleader>sc",
				send_file = "<localleader>sf",
				send_line = "<localleader>sl",
				send_paragraph = "<localleader>sp",
				send_until_cursor = "<localleader>su",
				send_mark = "<localleader>sm",
				send_code_block = "<localleader>sb",
				send_code_block_and_move = "<localleader>sn",
				mark_motion = "<localleader>mc",
				mark_visual = "<localleader>mc",
				remove_mark = "<localleader>md",
				cr = "<localleader>s<cr>",
				interrupt = "<localleader>s<space>",
				exit = "<localleader>sq",
				clear = "<localleader>cl",
			},
		},
		ft = {
			"python",
			"ipython",
			"ipynb"
		}
	}
}
