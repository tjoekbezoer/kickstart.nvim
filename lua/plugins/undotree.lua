return {
  'mbbill/undotree',
  config = function()
    vim.keymap.set('n', '<leader>z', vim.cmd.UndotreeToggle, { desc = 'Undo Tree' })

    vim.g.undotree_WindowLayout = 2
    vim.g.undotree_SplitWidth = 40
    vim.g.undotree_DiffpanelHeight = 20
    vim.g.undotree_SetFocusWhenToggle = 1
    -- TODO Find out how to use `delta` as a diff program. Right now the
    -- displayed results are garbled for some reason...
    vim.g.undotree_DiffCommand = 'diff'
  end,
}
