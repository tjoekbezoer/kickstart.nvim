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

    for i = 1, 5 do
      vim.keymap.set('n', '<C-' .. i .. '>', function()
        harpoon:list():select(i)
      end)
    end
  end,
}
