-- ========================================================================== --
-- ==           {{{   EDITOR SETTINGS                                      == --
-- ========================================================================== --

local opt = vim.opt -- alias for vim.opt
local key = vim.keymap.set -- alias for keymap.set
local api = vim.api -- alias for vim.api
local g = vim.g -- alias for vim.g

opt.number = true -- numbers in the left column
opt.mouse = "a"  -- enable mouse support in all modes
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- ignore case if search pattern is all lowercase
opt.gdefault = true -- replace all matches in a line by default
opt.hlsearch = false -- do not highlight search results by default
opt.wrap = false -- do not wrap lines by default
opt.breakindent = true -- indent wrapped lines
opt.tabstop = 4 -- number of spaces a tab counts for
opt.shiftwidth = 4 -- number of spaces used for each step of (auto)indent
opt.expandtab = true -- convert tabs to spaces
opt.autoindent = true -- copy indent from current line when starting a new line
opt.signcolumn = "yes" -- always show the sign column
opt.clipboard = "unnamedplus" -- use system clipboard
opt.cursorline = true -- highlight the current line
opt.foldlevel = 99 -- folding level to open all folds by default 
-- }}}
-- ========================================================================== --
-- ==           {{{   KEY BINDINGS                                         == --
-- ========================================================================== --

g.mapleader = " " -- space as leader
key("n", "<leader>ec", ":e $MYVIMRC<CR>", { desc = "Edit Config" }) -- edit neovim config file
key("i", "jk", "<esc>", { desc = "Go to Normal Mode" }) -- go to normal mode

key("n", "<leader>nn", ":set nonumber!<CR>", { desc =  "Toggle line numbers" }) -- toggle line numbers
key("n", "<leader>nr", ":set relativenumber!<CR>", { desc = "Toggle relative line numbers" }) -- toggle relative line numbers
key("n", "<leader>w", ":set wrap! wrap?<CR>", { desc = "Toggle line wrap" }) -- toggle line wrap

key({ "n", "x" }, "x", '"_x') -- delete without yanking

-- }}}
-- ========================================================================== --
-- ==           {{{  COMMANDS                                              == --
-- ========================================================================== --

api.nvim_create_user_command("ReloadConfig", "source $MYVIMRC", {}) -- reload config

local group = api.nvim_create_augroup("user_cmds", { clear = true }) -- augroup for user commands 

api.nvim_create_autocmd("TextYankPost", { -- highlight on yank
	desc = "Highlight on yank", 
	group = group, 
	callback = function() 
		vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
	end,
})

api.nvim_create_autocmd("FileType", { -- quit help buffers
	pattern = { "help", "man" },
	group = group,
	command = "nnoremap <buffer> q <cmd>quit<cr>",
})

api.nvim_set_keymap('c', '<Down>', 'v:lua.get_wildmenu_key("<right>", "<down>")', { expr = true }) -- cusror down in wildmenu
api.nvim_set_keymap('c', '<Up>', 'v:lua.get_wildmenu_key("<left>", "<up>")', { expr = true }) -- cusror up in wildmenu

function _G.get_wildmenu_key(key_wildmenu, key_regular)
return vim.fn.wildmenumode() ~= 0 and key_wildmenu or key_regular
end


-- }}}
