return {
  'ThePrimeagen/harpoon',
  -- branch = 'harpoon2',
  commit = 'e76cb03',
  dependencies = {
    -- 'vim-lua/plenary.nvim',
    -- 'nvim-telescope/telescope.nvim',
  },
  config = function()
    local harpoon = require 'harpoon'

    harpoon:setup {
      settings = {
        save_on_toggle = true,
        sync_on_ui_close = true,
      },
    }

    vim.keymap.set('n', '<leader>a', function()
      harpoon:list():add()
    end, { desc = '[A]dd to Harpoon' })
    vim.keymap.set('n', '<leader>k', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = 'Open Harpoon window' })

    vim.keymap.set('n', '<C-1>', function()
      harpoon:list():select(1)
    end)
    vim.keymap.set('n', '<C-2>', function()
      harpoon:list():select(2)
    end)
    vim.keymap.set('n', '<C-3>', function()
      harpoon:list():select(3)
    end)
    vim.keymap.set('n', '<C-4>', function()
      harpoon:list():select(4)
    end)
    vim.keymap.set('n', '<C-5>', function()
      harpoon:list():select(5)
    end)
  end,
}
