return {
  'rmagatti/auto-session',
  lazy = false,
  dependencies = {
    'nvim-telescope/telescope.nvim',
  },
  opts = {
    suppressed_dirs = { '~/', '~/Sites', '~/Downloads', '/' },
    -- log_level = 'debug',
    session_lens = {
      previewer = false,

      mappings = {
        -- Mode can be a string or a table, e.g. {"i", "n"} for both insert and normal mode
        delete_session = { 'i', '<C-X>' },
        alternate_session = { 'i', '<C-6>' },
      },
    },
  },
  keys = {
    { '<leader>sw', '<cmd>SessionSearch<CR>', desc = 'Session search' },
    { '<leader>wa', '<cmd>SessionSave<CR>', desc = 'Save session' },
    { '<leader>wd', '<cmd>Autosession delete<CR>', desc = 'Delete session' },
    -- { '<leader>wa', '<cmd>SessionToggleAutoSave<CR>', desc = 'Toggle autosave' },
  },
}
