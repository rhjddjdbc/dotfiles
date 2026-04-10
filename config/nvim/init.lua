-- ========================
-- Packer as Plugin-Manager
-- ========================
vim.cmd([[packadd packer.nvim]])

require('packer').startup(function(use)
  -- Packer manages itself
  use 'wbthomason/packer.nvim'

  -- ===========
  -- LSP & Tools
  -- ===========
  use 'neovim/nvim-lspconfig'   -- still used for Mason integration, not for setup
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use {
    "NeogitOrg/neogit",
    requires = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim"
    }
  }
  use 'nvim-neotest/nvim-nio'
  use 'ray-x/go.nvim'
  use 'ray-x/guihua.lua'

  -- ==================
  -- Search, Note, Wiki
  -- ==================
  use "nvim-telescope/telescope.nvim"
  use "nvim-lua/plenary.nvim"
  use "vimwiki/vimwiki"
  use "ThePrimeagen/harpoon"
  use {
    'iamcco/markdown-preview.nvim',
    run = 'cd app && npm install'
  }
  use 'lervag/vimtex'

  -- ==========
  -- Theme & UI
  -- ==========
  use 'Mofiqul/dracula.nvim'
  use {
    "nvim-lualine/lualine.nvim",
    requires = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = { theme = "dracula" }
      })
    end
  }
  use 'goolord/alpha-nvim'
  use "nvim-tree/nvim-web-devicons"
  use "stevearc/dressing.nvim"

  -- ==============
  -- DAP: Debugging
  -- ==============
  use 'mfussenegger/nvim-dap'
  use 'rcarriga/nvim-dap-ui'
  use {
    'leoluz/nvim-dap-go',
    config = function()
      require('dap-go').setup()
    end
  }

  -- ============
  -- Autocomplete
  -- ============
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'nvim-lua/lsp-status.nvim'

  -- ==================
  -- Ollama Integration
  -- ==================
  use {
    "nomnivore/ollama.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("ollama").setup({
        model = "qwen2.5-coder:0.5b",
        url = "http://127.0.0.1:11434"
      })
    end
  }

  -- ==========================
  -- Syntax Highlighting (Treesitter)
  -- ==========================
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      require('nvim-treesitter.install').update({ with_sync = true })
    end,
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = { "lua", "python", "c", "cpp", "rust", "bash", "markdown", "toml" },
        highlight = { enable = true },
      }
    end
  }

  -- Tmux navigation
  use 'christoomey/vim-tmux-navigator'

  -- ===========
  -- Mason Setup
  -- ===========
  require("mason").setup()
  require("mason-lspconfig").setup({
    ensure_installed = {
      "lua_ls", "pyright", "clangd", "texlab",
      "marksman", "taplo", "lemminx", "bashls", "gopls"
    }
  })
end)

-- =============
-- color & Theme
-- =============
vim.cmd[[colorscheme dracula]]

-- =================
-- LSP configuration (Neovim 0.11+ native API)
-- =================
local lspconfig = require('lspconfig')          -- only for Mason's default configs
local lsp_servers = {
  'lua_ls', 'pyright', 'clangd', 'texlab',
  'marksman', 'taplo', 'lemminx', 'bashls', 'gopls'
}

for _, server in ipairs(lsp_servers) do
  -- Let mason-lspconfig set up the default config, then use vim.lsp.enable
  lspconfig[server].setup({})
  vim.lsp.enable(server)
end

-- ===========
-- Startscreen
-- ===========
local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
  "=================     ===============     ===============   ========  ========",
  "\\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . //",
  "||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\\/ . . .||",
  "|| . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||",
  "||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||",
  "|| . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\\ . . . . ||",
  "||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\\_ . .|. .||",
  "|| . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\\ `-_/| . ||",
  "||_-' ||  .|/    || ||    \\|.  || `-_|| ||_-' ||  .|/    || ||   | \\  / |-_.||",
  "||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \\  / |  `||",
  "||    `'         || ||         `'    || ||    `'         || ||   | \\  / |   ||",
  "||            .===' `===.         .==='.`===.         .===' /==. |  \\/  |   ||",
  "||         .=='   \\_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \\/  |   ||",
  "||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \\/  |   ||",
  "||   .=='    _-'          `-__\\._-'         `-_./__-'         `' |. /|  |   ||",
  "||.=='    _-'                                                     `' |  /==.||",
  "=='    _-'                                                            \\/   `==",
  "\\   _-'                                                                `-_   /",
  " `''                                                                      `''",
}
dashboard.section.buttons.val = {
  dashboard.button("f ", "  Find file", ":Telescope find_files<CR>"),
  dashboard.button("e ", "  New file", ":ene <BAR> startinsert<CR>"),
  dashboard.button("q ", "  Quit Neovim", ":qa<CR>"),
}

dashboard.config.opts.noautocmd = true
alpha.setup(dashboard.config)

-- ======
-- Cursor
-- ======
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 6
vim.opt.cursorline = true
vim.cmd([[highlight CursorLineNr guifg=#ff6600 guibg=NONE]])

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  command = "set numberwidth=6",
})

-- =============
-- Lualine Setup
-- =============
require('lualine').setup {
  options = {
    icons_enabled = true,
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    theme = "dracula",
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  }
}

-- =============
-- Vimwiki Setup
-- =============
vim.g.vimwiki_list = {{
  path = '~/wiki',
  syntax = 'markdown',
  ext = '.md'
}}

-- ======================
-- DAP & UI configuration
-- ======================
local dap = require('dap')
local dapui = require('dapui')

dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end

-- Adapters
dap.adapters.gdb = {
  type = 'executable',
  command = 'gdb',
  args = {'-q'},
}

dap.adapters.lldb = {
  type = 'executable',
  command = '/usr/bin/lldb',
  name = "lldb"
}

dap.adapters.python = {
  type = 'executable',
  command = 'python',
  args = {'-m', 'debugpy.adapter'},
}

-- Go adapter is already configured by nvim-dap-go's config block above

-- =========================
-- Debug-configuration: Rust
-- =========================
dap.configurations.rust = {
  {
    name = "Rust Debugging",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to Rust binary: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopAtEntry = true,
  }
}

-- ===================================
-- Debug-configuration: C
-- ===================================
dap.configurations.c = {
  {
    name = "Launch with GDB",
    type = "gdb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopAtEntry = true,
  }
}

-- ===================================
-- Debug-configuration: C++
-- ===================================
dap.configurations.cpp = dap.configurations.c

-- ===================================
-- Debug-configuration: Go
-- ===================================
dap.configurations.go = {
  {
    name = "Go Debugging",
    type = "go",
    request = "launch",
    program = function()
      return vim.fn.input("Path to Go file: ", vim.fn.getcwd() .. "/", "file")
    end,
  }
}

-- ===================================
-- Debug-configuration: Python
-- ===================================
dap.configurations.python = {
  {
    type = "python",
    request = "launch",
    name = "Launch Python Debugger",
    program = function()
      return vim.fn.input("Path to Python file: ", vim.fn.getcwd() .. "/", "file")
    end,
    pythonPath = function()
      return "/usr/bin/python"
    end,
  }
}

-- ===================================
-- Key mappings
-- ===================================
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opts = { noremap = true, silent = true }

-- DAP
vim.api.nvim_set_keymap('n', '<leader>dt', ':DapToggleBreakpoint<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>dc', ':DapContinue<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>do', ':DapStepOver<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>di', ':DapStepInto<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>dr', ':DapRestart<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>dx', ':DapTerminate<CR>', opts)

-- VimWiki
vim.api.nvim_set_keymap('n', '<leader>ww', ':VimwikiIndex<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>wd', ':VimwikiMakeDiaryNote<CR>', opts)

-- Packer
vim.api.nvim_set_keymap('n', '<leader>ps', ':PackerSync<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>pi', ':PackerInstall<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>pc', ':PackerClean<CR>', opts)

-- Telescope
vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>fg', ':Telescope live_grep<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>fb', ':Telescope buffers<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>fh', ':Telescope help_tags<CR>', opts)

-- Tmux navigation
vim.api.nvim_set_keymap('n', '<C-h>', ':TmuxNavigateLeft<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-j>', ':TmuxNavigateDown<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-k>', ':TmuxNavigateUp<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-l>', ':TmuxNavigateRight<CR>', opts)
