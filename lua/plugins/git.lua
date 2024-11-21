return { -- Adds git related signs to the gutter, as well as utilities for managing changes
  'lewis6991/gitsigns.nvim',
  opts = {
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },

    on_attach = function(buffer)
      local gs = require 'gitsigns'
      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
      end

      map('n', ']g', gs.next_hunk, 'Next Chunk')
      map('n', '[g', gs.prev_hunk, 'Prev Chunk')
    end,
  },
}
