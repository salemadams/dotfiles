-- Leader Keys
vim.g.mapleader = ' '                    -- Set space as leader key
vim.g.maplocalleader = ' '               -- Set space as local leader key

-- Display
vim.g.have_nerd_font = true              -- Enable Nerd Font icons
vim.o.number = true                      -- Show line numbers
vim.o.relativenumber = true              -- Show relative line numbers
vim.o.showmode = false                   -- Hide mode indicator (e.g., -- INSERT --)
vim.o.signcolumn = 'yes'                 -- Always show sign column
vim.o.showmatch = true                   -- Highlight matching brackets
vim.o.cursorline = true                  -- Highlight current line

-- Mouse
vim.o.mouse = 'a'                        -- Enable mouse in all modes

-- File Handling
vim.o.undofile = true                    -- Persist undo history to file
vim.o.confirm = true                     -- Prompt to save before closing
vim.o.swapfile = false                   -- Disable swap files (annoying)

-- Clipboard
vim.opt.clipboard = "unnamedplus"        -- Sync with system clipboard

-- Line Wrapping
vim.o.wrap = false                       -- Do not wrap lines
vim.o.linebreak = true                   -- Wrap at word boundaries
vim.o.scrolloff = 20                     -- Keep 20 lines above/below cursor
vim.o.sidescrolloff = 10                 -- Keep 20 lines left/right cursor

-- Search
vim.o.ignorecase = true                  -- Case-insensitive search
vim.o.smartcase = true                   -- Case-sensitive if uppercase present

-- Timing
vim.o.updatetime = 250                   -- Faster CursorHold events (ms)
vim.o.timeoutlen = 300                   -- Time for mapped sequences (ms)
vim.o.ttimeoutlen = 0                    -- Time for key codes (ms)

-- Window Splits
vim.o.splitright = true                  -- Open vertical splits to the right
vim.o.splitbelow = true                  -- Open horizontal splits below

-- Indentation
vim.o.tabstop = 2                        -- Tab width in spaces
vim.o.shiftwidth = 2                     -- Indent width for >> and <<
vim.o.softtabstop = 2                    -- Tab key inserts this many spaces
vim.o.expandtab = true                   -- Use spaces instead of tabs
vim.o.smartindent = true                 -- Auto-indent based on syntax

-- Command-line completion
vim.opt.wildmode = 'longest:full,full'
vim.opt.wildignore:append({
  'node_modules/*', 'bin/*', 'obj/*', 'dist/*', 'build/*', '.git/*', 
  '__pycache__/*', '*.pyc', '*.pyo',
  '.cache/*', 'tmp/*', 'temp/*',
  '*.swp', '*.swo',
})
