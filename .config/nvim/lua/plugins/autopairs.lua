return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  config = function()
    local npairs = require 'nvim-autopairs'

    -- Setup autopairs with VSCode-like behavior
    npairs.setup {
      check_ts = true, -- Use treesitter for better pair detection
      ts_config = {
        lua = { 'string' }, -- Don't add pairs in lua string treesitter nodes
        javascript = { 'template_string' },
        java = false, -- Don't check treesitter on java
      },
      disable_filetype = { 'TelescopePrompt', 'vim' },
      disable_in_macro = false,
      disable_in_visualblock = false,
      disable_in_replace_mode = true,
      ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=],
      enable_moveright = true,
      enable_afterquote = true,
      enable_check_bracket_line = true,
      enable_bracket_in_quote = true,
      enable_abbr = false,
      break_undo = true,
      map_cr = true, -- Map <CR> to create new line between pairs
      map_bs = true, -- Map backspace to delete pairs
      map_c_h = false, -- Disabled to avoid conflict with window navigation
      map_c_w = false,
    }

    -- Custom keybindings to insert brackets without auto-closing
    -- Hold Ctrl while typing bracket to prevent auto-pairing
    -- NOTE: <C-[> is removed because it's equivalent to Esc in terminals
    vim.keymap.set('i', '<C-{>', '{', { desc = 'Insert { without autopair' })
    vim.keymap.set('i', '<C-}>', '}', { desc = 'Insert } without autopair' })
    vim.keymap.set('i', '<C-(>', '(', { desc = 'Insert ( without autopair' })
    vim.keymap.set('i', '<C-)>', ')', { desc = 'Insert ) without autopair' })
    -- vim.keymap.set('i', '<C-[>', '[', { desc = 'Insert [ without autopair' }) -- REMOVED: Conflicts with Esc
    vim.keymap.set('i', '<C-]>', ']', { desc = 'Insert ] without autopair' })
    vim.keymap.set('i', '<C-">', '"', { desc = 'Insert " without autopair' })
    vim.keymap.set('i', "<C-'>", "'", { desc = "Insert ' without autopair" })
    vim.keymap.set('i', '<C-`>', '`', { desc = 'Insert ` without autopair' })
  end,
}
