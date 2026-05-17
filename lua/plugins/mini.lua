return {
  'echasnovski/mini.nvim',
  config = function()
    -- Simple file browser
    local MiniFiles = require 'mini.files'
    MiniFiles.setup {
      content = {
        filter = function(item)
          return not (item.name == '.DS_Store' or item.name == '.git')
        end,
      },
      mappings = {
        close = 'q',
        go_in = '<right>',
        go_in_plus = 'L',
        go_out = '<left>',
        go_out_plus = 'H',
        reset = '<BS>',
        reveal_cwd = '@',
        show_help = '<C-/>',
        synchronize = '=',
        trim_left = '>',
        trim_right = '<',
      },
      windows = {
        preview = true,
        width_preview = 120,
      },
    }

    local files_set_cwd = function()
      -- Works only if cursor is on the valid file system entry
      local cur_entry_path = MiniFiles.get_fs_entry().path
      local cur_directory = vim.fs.dirname(cur_entry_path)
      vim.fn.chdir(cur_directory)
    end

    vim.api.nvim_create_autocmd('User', {
      pattern = 'MiniFilesBufferCreate',
      callback = function(args)
        vim.keymap.set('n', 'cd', files_set_cwd, { buffer = args.data.buf_id })
      end,
    })

    vim.keymap.set('n', '<leader>b', function()
      MiniFiles.open()
    end, { desc = '[B]rowse Filesystem' })

    vim.keymap.set('n', '<leader>rb', function()
      MiniFiles.open(vim.api.nvim_buf_get_name(0))
      MiniFiles.reveal_cwd()
    end, { desc = '[B]rowse Filesystem' })

    -- Better Around/Inside textobjects
    --
    -- Examples:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [']quote
    --  - ci'  - [C]hange [I]nside [']quote
    local MiniAI = require 'mini.ai'
    MiniAI.setup {
      n_lines = 500,
      custom_textobjects = {
        o = MiniAI.gen_spec.treesitter({
          a = { '@block.outer', '@conditional.outer', '@loop.outer' },
          i = { '@block.inner', '@conditional.inner', '@loop.inner' },
        }, {}),
        f = MiniAI.gen_spec.treesitter({ a = '@function.outer', i = '@function.inner' }, {}),
        c = MiniAI.gen_spec.treesitter({ a = '@class.outer', i = '@class.inner' }, {}),
      },
    }

    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    --
    -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
    -- - sd'   - [S]urround [D]elete [']quotes
    -- - sr)'  - [S]urround [R]eplace [)] [']
    require('mini.surround').setup {
      mappings = {
        add = 'ys',
        delete = 'ds',
        find = '',
        find_left = '',
        highlight = '',
        replace = 'cs',
        update_n_lines = '',
      },
    }

    require('mini.comment').setup {
      mappings = {
        comment = 'gc',
        comment_line = 'gcc',
        comment_visual = 'gc',
        textobject = 'gc',
      },
    }

    -- Simple and easy statusline.
    --  You could remove this setup call if you don't like it,
    --  and try some other statusline plugin
    local MiniStatusLine = require 'mini.statusline'
    -- set use_icons to true if you have a Nerd Font
    MiniStatusLine.setup { use_icons = vim.g.have_nerd_font }

    -- You can configure sections in the statusline by overriding their
    -- default behavior. For example, here we set the section for
    -- cursor location to LINE:COLUMN
    ---@diagnostic disable-next-line: duplicate-set-field
    MiniStatusLine.section_location = function()
      return '%2l:%-2v'
    end

    -- ... and there is more!
    --  Check out: https://github.com/echasnovski/mini.nvim
  end,
}
