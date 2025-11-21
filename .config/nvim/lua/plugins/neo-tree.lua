-- [[ Neo-tree File Explorer ]]
-- IDE-like file explorer with git integration
-- See `:help neo-tree`

return {
  'nvim-neo-tree/neo-tree.nvim',
	    config = function()
        require("nvim-tree").setup({
            filters = {
                dotfiles = true,
            },
            lazy = false
        }),
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '<leader>e', '<cmd>Neotree toggle<cr>', desc = 'Toggle File [E]xplorer' },
    { '<leader>o', '<cmd>Neotree focus<cr>', desc = 'Focus File Explorer' },
  },
  opts = {
    close_if_last_window = true, -- Close Neo-tree if it's the last window
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
      position = 'left',
      width = 35,
      mappings = {
        -- Navigation
        ['<cr>'] = 'open',
        ['<esc>'] = 'cancel',
        ['l'] = 'open',
        ['h'] = 'close_node',
        ['P'] = { 'toggle_preview', config = { use_float = true, use_image_nvim = true } },

        -- File operations
        ['a'] = { 'add', config = { show_path = 'relative' } },
        ['d'] = 'delete',
        ['r'] = 'rename',
        ['y'] = 'copy_to_clipboard',
        ['x'] = 'cut_to_clipboard',
        ['p'] = 'paste_from_clipboard',
        ['c'] = 'copy',
        ['m'] = 'move',

        -- View options
        ['H'] = 'toggle_hidden',
        ['R'] = 'refresh',
        ['?'] = 'show_help',
        ['/'] = 'fuzzy_finder',
        ['f'] = 'filter_on_submit',
        ['<c-x>'] = 'clear_filter',

        -- Split/tab operations
        ['s'] = 'open_split',
        ['v'] = 'open_vsplit',
        ['t'] = 'open_tabnew',
      },
    },

    filesystem = {
      follow_current_file = {
        enabled = true, -- Reveal file in tree when switching buffers
      },
      use_libuv_file_watcher = true, -- Auto-refresh on file changes
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
