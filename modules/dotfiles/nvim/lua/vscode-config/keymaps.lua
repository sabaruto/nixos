local keymap = vim.keymap.set
local opts = {
    noremap = true,
    silent = true
}

-- remap leader key
keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = "    "

-- Command line key
keymap({ "n", "v" }, "<leader>j", ":", {
    remap = true,
    desc = "Set command line"
})
keymap({ "n", "v" }, "<leader><cr>", ":", {
    remap = true,
    desc = "Set command line"
})

-- yank to system clipboard
keymap({ "n", "v" }, "<leader>y", '"+y', opts)

-- better saving
keymap({ "n", "v" }, "<leader>w", "<cmd>write<cr>", {
    desc = "Save buffer",
    silent = true
})

-- paste from system clipboard
keymap({ "n", "v" }, "<leader>p", '"+p', opts)

-- better indent handling
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- move text up and down
keymap("v", "J", ":m .+1<CR>==", opts)
keymap("v", "K", ":m .-2<CR>==", opts)
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

-- paste preserves primal yanked piece
keymap("v", "p", '"_dP', opts)

-- removes highlighting after escaping vim search
keymap("n", "<Esc>", "<Esc>:noh<CR>", opts)

---- call vscode commands from neovim

-- general keymaps
keymap({ "n", "v" }, "<leader>t", "<cmd>lua require('vscode').action('workbench.action.terminal.toggleTerminal')<CR>")

keymap({ "n", "v" }, "K", "<cmd>lua require('vscode').action('editor.action.showHover')<CR>")

keymap({ "n", "v" }, "<c-right>", "<cmd>lua require('vscode').action('workbench.action.focusRightGroup')<CR>")
keymap({ "n", "v" }, "<c-left>", "<cmd>lua require('vscode').action('workbench.action.focusLeftGroup')<CR>")
keymap({ "n", "v" }, "<c-down>", "<cmd>lua require('vscode').action('workbench.action.focusBelowGroup')<CR>")
keymap({ "n", "v" }, "<c-up>", "<cmd>lua require('vscode').action('workbench.action.focusAboveGroup')<CR>")

keymap({ "n", "v" }, "ga", "<cmd>lua require('vscode').action('editor.action.quickFix')<CR>")
keymap({ "n", "v" }, "gr", "<cmd>lua require('vscode').action('editor.action.goToReferences')<CR>")

keymap({ "n", "v" }, "<leader>cx", "<cmd>lua require('vscode').action('workbench.actions.view.problems')<CR>")
keymap({ "n", "v" }, "<leader>cn", "<cmd>lua require('vscode').action('notifications.clearAll')<CR>")
keymap({ "n", "v" }, "<leader>cr", "<cmd>lua require('vscode').action('code-runner.run')<CR>")
keymap({ "n", "v" }, "<leader>cb", "<cmd>lua require('vscode').action('editor.debug.action.toggleBreakpoint')<CR>")

keymap({ "n", "v" }, "<leader>ff", "<cmd>lua require('vscode').action('workbench.action.quickOpen')<CR>")
keymap({ "n", "v" }, "<leader>fc", "<cmd>lua require('vscode').action('workbench.action.showCommands')<CR>")
keymap({ "n", "v" }, "<leader>fd", "<cmd>lua require('vscode').action('editor.action.formatDocument')<CR>")

keymap({ "n", "v" }, "<leader>e", "<cmd>lua require('vscode').action('workbench.explorer.fileView.focus')<CR>")

keymap({ "n", "v" }, "<C-o>", "<cmd>lua require('vscode').action('workbench.action.navigateBack')<CR>")
keymap({ "n", "v" }, "<C-i>", "<cmd>lua require('vscode').action('workbench.action.navigateForward')<CR>")

keymap({ "n", "v" }, "<leader>bd", "<cmd>lua require('vscode').action('workbench.action.closeActiveEditor')<cr>")
keymap({ "n", "v" }, "<leader>bo", "<cmd>lua require('vscode').action('workbench.action.closeOtherEditors')<cr>")

keymap({ "n", "v" }, "<leader>xd", "<cmd>lua require('vscode').action('workbench.action.closeGroup')<cr>")

keymap({ "n" }, "gcc", function() require("vscode").action("editor.action.commentLine") end)

keymap({ "n" }, "gc", function() require("vscode").action("editor.action.commentLine") end)

keymap({ "n" }, "]d", function() require("vscode").action("editor.action.marker.next") end)
keymap({ "n" }, "[d", function() require("vscode").action("editor.action.marker.prev") end)

-- harpoon keymaps
keymap({ "n", "v" }, "<leader>ha", "<cmd>lua require('vscode').action('vscode-harpoon.addEditor')<CR>")
keymap({ "n", "v" }, "<leader>ho", "<cmd>lua require('vscode').action('vscode-harpoon.editorQuickPick')<CR>")
keymap({ "n", "v" }, "<leader>he", "<cmd>lua require('vscode').action('vscode-harpoon.editEditors')<CR>")
keymap({ "n", "v" }, "<leader>h1", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor1')<CR>")
keymap({ "n", "v" }, "<leader>h2", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor2')<CR>")
keymap({ "n", "v" }, "<leader>h3", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor3')<CR>")
keymap({ "n", "v" }, "<leader>h4", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor4')<CR>")
keymap({ "n", "v" }, "<leader>h5", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor5')<CR>")
keymap({ "n", "v" }, "<leader>h6", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor6')<CR>")
keymap({ "n", "v" }, "<leader>h7", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor7')<CR>")
keymap({ "n", "v" }, "<leader>h8", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor8')<CR>")
keymap({ "n", "v" }, "<leader>h9", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor9')<CR>")

-- project manager keymaps
keymap({ "n", "v" }, "<leader>pa", "<cmd>lua require('vscode').action('projectManager.saveProject')<CR>")
keymap({ "n", "v" }, "<leader>po", "<cmd>lua require('vscode').action('projectManager.listProjectsNewWindow')<CR>")
keymap({ "n", "v" }, "<leader>pe", "<cmd>lua require('vscode').action('projectManager.editProjects')<CR>")
