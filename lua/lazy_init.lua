local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  {
    'folke/tokyonight.nvim',
    enabled = false,
    -- priority = 1000, -- Make sure to load this before all the other start plugins.
    --   init = function()
    --     vim.cmd.colorscheme 'tokyonight-night'
    --
    --     -- You can configure highlights by doing something like:
    --     vim.cmd.hi 'Comment gui=none'
    --   end,
  },
  {
    'zenbones-theme/zenbones.nvim',
    dependencies = { 'rktjmp/lush.nvim' },

    priority = 1000,
    init = function()
      vim.cmd.colorscheme 'zenwritten'
      vim.o.background = 'light'
    end,
    -- Toggle between light and dark version of the theme
    config = function()
      vim.keymap.set('n', '<leader>tt', function()
        vim.o.termguicolors = true
        local is_light = vim.o.background == 'light'

        if is_light then
          vim.o.background = 'dark'
          -- vim.cmd.colorscheme 'tokyonight-night'
          vim.cmd.colorscheme 'zenwritten'
        else
          vim.o.background = 'light'
          vim.cmd.colorscheme 'zenwritten'
        end
      end)
    end,
  },

  { 'vim-lua/plenary.nvim', lazy = true },
  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  { 'michaeljsmith/vim-indent-object' },
  -- Detect tabstop and shiftwidth automatically
  { 'tpope/vim-sleuth' },
  -- Autoindent on p/P/o/O a bit smarter than default
  { 'ku1ik/vim-pasta' },

  { import = 'plugins' },
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})
