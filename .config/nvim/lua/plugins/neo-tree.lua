-- [[ Neo-tree File Explorer ]]
return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  keys = {
    { '<leader>e', '<cmd>Neotree toggle<cr>', desc = 'Toggle File [E]xplorer' },
    { '<leader>o', '<cmd>Neotree focus<cr>', desc = 'Focus File Explorer' },
  },
  init = function()
    -- Disable netrw
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- Handle directory opening on startup
    vim.api.nvim_create_autocmd('VimEnter', {
      group = vim.api.nvim_create_augroup('NeoTreeStartup', { clear = true }),
      callback = function()
        local arg = vim.fn.argv(0)
        if vim.fn.isdirectory(arg) == 1 then
          -- Open neo-tree with the directory
          vim.cmd('Neotree position=current dir=' .. vim.fn.fnameescape(arg))
          -- Delete the empty buffer that was created
          vim.defer_fn(function()
            -- Find and delete any empty, unnamed buffers
            for _, buf in ipairs(vim.api.nvim_list_bufs()) do
              if vim.api.nvim_buf_get_name(buf) == '' and vim.api.nvim_buf_is_loaded(buf) then
                vim.api.nvim_buf_delete(buf, { force = true })
              end
            end
          end, 10)
        end
      end,
    })

    -- Handle :edit <directory> or :e <directory>
    vim.api.nvim_create_autocmd('BufEnter', {
      group = vim.api.nvim_create_augroup('NeoTreeHijackDir', { clear = true }),
      pattern = '*',
      callback = function(args)
        local stats = vim.loop.fs_stat(args.file)
        if stats and stats.type == 'directory' and vim.bo[args.buf].buftype ~= 'nofile' then
          vim.cmd('Neotree position=current dir=' .. vim.fn.fnameescape(args.file))
        end
      end,
    })
  end,
  opts = {
    close_if_last_window = true,
    popup_border_style = 'rounded',
    enable_git_status = true,
    enable_diagnostics = true,
    default_component_configs = {
      indent = {
        with_expanders = true,
        expander_collapsed = '',
        expander_expanded = '',
      },
      git_status = {
        symbols = {
          added = '',
          modified = '',
          deleted = '',
          renamed = '➜',
          untracked = '★',
          ignored = '◌',
          unstaged = '✗',
          staged = '✓',
          conflict = '',
        },
      },
    },
    window = {
      width = 35,
      mappings = {
        ['<cr>'] = 'open',
        ['<esc>'] = 'cancel',
        ['l'] = 'open',
        ['h'] = 'close_node',
        ['P'] = { 'toggle_preview', config = { use_float = true, use_image_nvim = true } },
        ['a'] = { 'add', config = { show_path = 'relative' } },
        ['d'] = 'delete',
        ['r'] = 'rename',
        ['y'] = 'copy_to_clipboard',
        ['x'] = 'cut_to_clipboard',
        ['p'] = 'paste_from_clipboard',
        ['c'] = 'copy',
        ['m'] = 'move',
        ['H'] = 'toggle_hidden',
        ['R'] = 'refresh',
        ['?'] = 'show_help',
        ['/'] = 'fuzzy_finder',
        ['f'] = 'filter_on_submit',
        ['<c-x>'] = 'clear_filter',
        ['s'] = 'open_split',
        ['v'] = 'open_vsplit',
        ['t'] = 'open_tabnew',
      },
    },
    filesystem = {
      hijack_netrw_behavior = 'open_current',
      follow_current_file = {
        enabled = true,
      },
      use_libuv_file_watcher = true,
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_by_name = {
          'node_modules',
          '.git',
          '.DS_Store',
        },
      },
    },
  },
}
