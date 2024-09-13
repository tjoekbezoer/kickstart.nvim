vim.g.neovide_input_macos_option_key_is_meta = 'both'
vim.g.neovide_hide_mouse_when_typing = 1

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- Make line numbers default
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

vim.opt.clipboard = 'unnamedplus'

vim.opt.smartindent = true
-- vim.opt.formatoptions = 'jtcroql'
-- vim.opt.formatoptions = 'jcroql'
vim.opt.textwidth = 0
-- Enable break indent
vim.opt.breakindent = true
-- Break on whole words when wrap is enabled
vim.opt.linebreak = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- To be able to indentify folds when they are opened
vim.opt.foldcolumn = '0'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = false
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
-- Only set listchars in visual mode
vim.api.nvim_create_autocmd('ModeChanged', {
  pattern = '[vV\x16]*:*',
  command = 'set nolist',
})
vim.api.nvim_create_autocmd('ModeChanged', {
  pattern = '*:[vV\x16]*',
  command = 'set list',
})

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 5

-- Set highlight on search
vim.opt.hlsearch = true
