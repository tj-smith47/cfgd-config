-- [[ Globals ]]
local global = vim.g

-- Set leader keys
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
global.mapleader = " "
global.maplocalleader = ","

-- Language Server Settings
global.loaded_perl_provider = 0 -- don't load perl LSP Provider
-- global.loaded_ruby_provider = 0 -- don't load ruby LSP Provider
-- global.python3_host_prog = vim.fn.exepath("python3")

-- Disable default gx mapping
global.netrw_nogx = 1 -- disable netrw 'gx' mapping

-- Disable netrw
global.loaded_netrw = 1 -- disable netrw
global.loaded_netrwPlugin = 1 -- disable netrw

-- [[ Options ]]
local opt = vim.opt

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- command line
-- vim.opt.cmdheight = 0 -- height of the command bar

-- context
opt.number = true -- shows absolute line numbers
opt.path = "**/**" -- search in subdirectories
opt.scrolloff = 8 -- lines of context

-- cursor line
opt.cursorline = true -- highlight the current cursor line

-- folding
-- opt.expandtab = true                      -- use spaces instead of tabs
-- opt.foldlevel = 99
-- opt.foldcolumn = "1"
-- opt.foldlevelstart = 99
-- opt.foldmethod = "expr"
-- opt.foldexpr = "nvim_treesitter#foldexpr()"
-- opt.foldenable = true

-- line wrapping
-- opt.wrap = false -- disable line wrapping

-- misc
-- opt.clipboard:append("unnamedplus")       -- use system clipboard as default register

opt.completeopt = "menu,menuone,noselect" -- set completeopt for a custom experience
opt.mouse = "a" -- enable mouse mode
opt.swapfile = false -- disable swap file
opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions,globals"
opt.undofile = true -- save undo history
opt.updatetime = 100 -- decrease update time
opt.wildmode = "longest:full:full"
opt.wildignore = "*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx,*DS_STORE"

-- tabs & indentation
opt.autoindent = true -- copy indent from current line when starting new one
opt.breakindent = true -- enable break indent
opt.expandtab = true -- expand tab to spaces
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.smartindent = true -- smart indenting
opt.softtabstop = 2 -- Number of spaces tabs count for
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)

-- search settings
opt.hlsearch = false -- disable highlight on search
opt.ignorecase = true -- ignore case when searching
opt.incsearch = true -- incremental search
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- split windows
opt.splitbelow = true -- split horizontal window to the bottom

-- ui
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.guifont = "FiraCode Nerd Font Mono"
opt.pumheight = 10 -- pop-up menu height
opt.signcolumn = "yes" -- show sign column so that text doesn't shift
opt.termguicolors = true

local ok, nvim_notify = pcall(require, "notify")
if not ok then
  return
end

-- Configs
vim.notify = nvim_notify
vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#bd93f9" })
vim.diagnostic.config({
  float = {
    border = "rounded",
    source = true,
    style = "minimal",
  },
  inlay_hint = { enabled = false },
  severity_sort = true,
  underline = false,
  update_in_insert = false,
  virtual_text = false,
})
