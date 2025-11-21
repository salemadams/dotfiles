-- [[ Bufferline - VSCode-style tabs ]]
-- Shows open buffers as tabs at the top

return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  opts = {
    options = {
      close_command = "bdelete! %d",       -- can be a string | function, see "Mouse actions"
      right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
      offsets = {
        {
          filetype = "neo-tree",
          text = "File Explorer",
          highlight = "Directory",
          text_align = "left"
        }
      },
    }
  },
  config = function(_, opts)
    require('bufferline').setup(opts)

    -- Smart buffer delete that keeps Neo-tree open
    local function smart_buffer_delete()
      local bufnr = vim.api.nvim_get_current_buf()
      local buffers = vim.fn.getbufinfo({ buflisted = 1 })

      -- Filter out Neo-tree and other special buffers
      local normal_buffers = vim.tbl_filter(function(buf)
        local buftype = vim.bo[buf.bufnr].buftype
        local filetype = vim.bo[buf.bufnr].filetype
        return buftype == '' and filetype ~= 'neo-tree'
      end, buffers)

      -- If this is the last normal buffer, open file explorer instead of closing
      if #normal_buffers <= 1 then
        vim.cmd('Neotree reveal')
      else
        -- Switch to another buffer before deleting the current one
        -- This prevents closing nvim when deleting the active buffer
        local found_alt = false
        for _, buf in ipairs(normal_buffers) do
          if buf.bufnr ~= bufnr then
            vim.cmd('buffer ' .. buf.bufnr)
            found_alt = true
            break
          end
        end

        -- Now delete the original buffer
        if found_alt then
          vim.cmd('bdelete ' .. bufnr)
        end
      end
    end

    -- Keybindings for buffer navigation and closing
    vim.keymap.set('n', '<leader>x', smart_buffer_delete, { desc = 'Close current buffer', silent = true })
    vim.keymap.set('n', '<leader>X', ':BufferLineCloseOthers<CR>', { desc = 'Close other buffers', silent = true })
    vim.keymap.set('n', '<Tab>', ':BufferLineCycleNext<CR>', { desc = 'Next buffer', silent = true })
    vim.keymap.set('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', { desc = 'Previous buffer', silent = true })
  end,
}
