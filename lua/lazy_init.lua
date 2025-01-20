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
    -- 'Shatur/neovim-ayu', 'catppuccin/nvim'
    'zenbones-theme/zenbones.nvim',
    dependencies = { 'rktjmp/lush.nvim', { 'rose-pine/neovim', name = 'rose-pine' } },

    priority = 1000,
    -- Toggle between light and dark version of the theme
    config = function()
      require('rose-pine').setup {
        styles = {
          italic = false,
          transparent = false,
        },
      }

      local theme = function(type)
        local t = type or 'dark'
        vim.g.THEME = t
        vim.o.background = t
        vim.cmd.colorscheme(t == 'light' and 'rose-pine-dawn' or 'rose-pine-moon')

        -- Remove blend property from the visual group, because it produces
        -- weird transparency issues in Neovide
        local hl = vim.api.nvim_get_hl(0, { name = 'Visual', link = false })
        hl.blend = 0
        vim.api.nvim_set_hl(0, 'Visual', hl)
      end

      -- Wait until vim has finished loading, because the shada file
      -- is loaded as one of the last things. The THEME variable is
      -- stored in the shada file.
      vim.api.nvim_create_autocmd('VimEnter', {
        callback = function()
          theme(vim.g.THEME)
        end,
      })

      vim.keymap.set('n', '<leader>tt', function()
        vim.o.termguicolors = true
        local is_light = vim.o.background == 'light'

        if is_light then
          theme 'dark'
        else
          theme 'light'
        end
      end)
    end,
  },

  { 'vim-lua/plenary.nvim', lazy = true },
  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  -- Operator pending addition to operate on indentation level.
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
  change_detection = {
    enabled = false,
  },
})
