--[[
=====================================================================
==================== NEOVIM CONFIGURATION ===========================
=====================================================================

This configuration is organized into modular files for maintainability:

  lua/config/
    ├── options.lua   - Vim options (line numbers, clipboard, splits, etc.)
    ├── keymaps.lua   - General keymaps (window navigation, terminal mode, etc.)
    ├── autocmds.lua  - Autocommands (highlight on yank, etc.)
    └── lazy.lua      - lazy.nvim plugin manager bootstrap

  lua/plugins/
    ├── telescope.lua    - Fuzzy finder for files, grep, help, etc.
    ├── lsp.lua          - Language Server Protocol configuration
    ├── completion.lua   - Autocompletion with blink.cmp
    ├── conform.lua      - Code formatting
    ├── treesitter.lua   - Syntax highlighting and parsing
    ├── colorscheme.lua  - Color theme configuration
    └── ui.lua           - UI plugins (which-key, statusline, gitsigns, etc.)

To check plugin status:       :Lazy
To update plugins:            :Lazy update
To check LSP status:          :Mason
To check health:              :checkhealth

Original kickstart.nvim config backed up to: init.lua.backup

=====================================================================
--]]

-- [[ Load Core Configuration ]]
-- These must be loaded before plugins to ensure proper initialization

-- Set leader keys and vim options
-- NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
require 'config.options'

-- Load general keymaps (window navigation, terminal mode, etc.)
require 'config.keymaps'

-- Load autocommands (highlight on yank, etc.)
require 'config.autocmds'

-- [[ Bootstrap lazy.nvim Plugin Manager ]]
-- This will auto-install lazy.nvim if it's not already installed
require 'config.lazy'

-- [[ Configure and Install Plugins ]]
--
-- To check the current status of your plugins, run:
--   :Lazy
--
-- You can press `?` in the Lazy menu for help. Use `:q` to close the window.
--
-- To update plugins you can run:
--   :Lazy update
--
-- Plugins are automatically loaded from lua/plugins/*.lua
-- Each plugin file should return a table (or array of tables) with plugin specifications.
--
-- You can add your own plugins by creating new files in lua/plugins/
-- For example: lua/plugins/myconfig.lua
--
require('lazy').setup({
  -- Import all plugin specifications from lua/plugins/
  -- Each .lua file in that directory should return a plugin spec
  { import = 'plugins' },
}, {
  -- Configure the lazy.nvim UI
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
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
