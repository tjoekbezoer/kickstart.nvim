---@type LazySpec
return {
  'mikavilpas/yazi.nvim',
  version = 'v13.1.5',
  event = 'VeryLazy',
  dependencies = {
    { 'nvim-lua/plenary.nvim', lazy = true },
  },
  keys = {
    {
      '<leader>y',
      mode = { 'n', 'v' },
      '<cmd>Yazi<cr>',
      desc = 'Open yazi at the current file',
    },
    {
      '<leader>ry',
      '<cmd>Yazi toggle<cr>',
      desc = 'Resume the last yazi session',
    },
    {
      '<leader>cy',
      '<cmd>Yazi cwd<cr>',
      desc = "Open the file manager in nvim's working directory",
    },
  },
  opts = {
    floating_window_scaling_factor = 0.6,
    open_for_directories = false,
    keymaps = {
      open_file_in_horizontal_split = '<c-s>',
      grep_in_directory = false,
    },
  },
  -- 👇 if you use `open_for_directories=true`, this is recommended
  init = function()
    -- mark netrw as loaded so it's not loaded at all.
    --
    -- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
    vim.g.loaded_netrwPlugin = 1
  end,
}
