" Enable Mouse
set mouse=a

" Disable GUI Tabline
if exists(':GuiTabline')
    GuiTabline 0
endif

" Disable GUI Popupmenu
if exists(':GuiPopupmenu')
    GuiPopupmenu 0
endif

" Enable GUI ScrollBar
if exists(':GuiScrollBar')
    GuiScrollBar 1
endif

if exists(':GuiFont')
    let s:fontsize = 12
    "let s:font = "Droid Sans Mono for Powerline"
    let s:font = "DroidSansM Nerd Font Mono"
    function! AdjustFontSize(amount)
        let s:fontsize = s:fontsize+a:amount
        execute ":GuiFont! " . s:font . ":h" . s:fontsize
        "let s:f = s:font . ":" . s:fontsize
        "lua vim.opt.guifont = { font, fontsize }
    endfunction
endif

call AdjustFontSize(0)

" lua print(vim.opt.guifont._value)
" set guifont=*
noremap <C-ScrollWheelUp> :call AdjustFontSize(1)<CR>
noremap <C-ScrollWheelDown> :call AdjustFontSize(-1)<CR>
inoremap <C-ScrollWheelUp> <Esc>:call AdjustFontSize(1)<CR>a
inoremap <C-ScrollWheelDown> <Esc>:call AdjustFontSize(-1)<CR>a

" In normal mode, pressing numpad's+ increases the font
noremap <c-+> :call AdjustFontSize(1)<CR>
noremap <c--> :call AdjustFontSize(-1)<CR>

" In insert mode, pressing ctrl + numpad's+ increases the font
inoremap <c-+> <Esc>:call AdjustFontSize(1)<CR>a
inoremap <c--> <Esc>:call AdjustFontSize(-1)<CR>a
