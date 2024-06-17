local opt = vim.opt

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- turn on termguicolors for nightfly colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift
opt.colorcolumn = {81, 101, 121}
opt.list = true
opt.listchars = {
    tab="» ",
    eol=" ",
    trail="·"
}

opt.scrolloff = 8
opt.formatoptions = "croqljn"
opt.completeopt = "longest,menuone"
opt.wildmode = "longest:full"

vim.cmd("autocmd WinEnter * setlocal cursorline")
vim.cmd("autocmd WinLeave * setlocal nocursorline")

vim.api.nvim_command("hi NonText guifg=gray ctermfg=gray")

-- Highlight trailing whitespace
vim.api.nvim_command("highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen")
vim.api.nvim_command("au InsertEnter * 2match ExtraWhiteSpace /\\s\\+\\%#\\@<!$/")
vim.api.nvim_command("au InsertLeave * 2match ExtraWhiteSpace /\\s\\+$/")

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

vim.cmd("set title titlestring=%F")

vim.cmd("set matchpairs+=<:>")

