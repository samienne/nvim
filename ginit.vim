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
    let s:fontsize = 10
    "let s:font = "Droid Sans Mono for Powerline"
    let s:font = "DroidSansM Nerd Font Mono"
    function! AdjustFontSize(amount)
        let s:fontsize = s:fontsize+a:amount
        execute ":GuiFont! " . s:font . ":h" . s:fontsize
        "let s:f = s:font . ":" . s:fontsize
        "lua vim.opt.guifont = { font, fontsize }
    endfunction
endif

if exists("g:neovide")
    let g:neovide_floating_blur_amount_x = 2.0
    let g:neovide_floating_blur_amount_y = 2.0

    let g:neovide_floating_shadow = v:true
    let g:neovide_floating_z_height = 10
    let g:neovide_light_angle_degrees = 45
    let g:neovide_light_radius = 5

    " let g:neovide_opacity = 0.8
    " let g:neovide_normal_opacity = 0.8

    let s:fontsize = 14
    let s:font = "DroidSansM\\ Nerd\\ Font\\ Mono"

    function! AdjustFontSize(amount)
        let s:fontsize = s:fontsize+a:amount
        execute ":set guifont=" . s:font . ":h" . s:fontsize . ":liga=0"
    endfunction
    "set guifont=DroidSansM\ Nerd\ Font\ Mono
endif

if exists("*AdjustFontSize")
    noremap <C-ScrollWheelUp> :call AdjustFontSize(1)<CR>
    noremap <C-ScrollWheelDown> :call AdjustFontSize(-1)<CR>
    inoremap <C-ScrollWheelUp> <Esc>:call AdjustFontSize(1)<CR>a
    noremap <C-ScrollWheelUp> :call AdjustFontSize(1)<CR>
    noremap <C-ScrollWheelDown> :call AdjustFontSize(-1)<CR>
    inoremap <C-ScrollWheelUp> <Esc>:call AdjustFontSize(1)<CR>a
    inoremap <C-ScrollWheelDown> <Esc>:call AdjustFontSize(-1)<CR>a

    " In normal mode, pressing numpad's+ increases the font
    noremap <c-+> :call AdjustFontSize(1)<CR>
    noremap <c-_> :call AdjustFontSize(-1)<CR>

    " In insert mode, pressing ctrl + numpad's+ increases the font
    inoremap <c-+> <Esc>:call AdjustFontSize(1)<CR>a
    inoremap <c--> <Esc>:call AdjustFontSize(-1)<CR>a

    call AdjustFontSize(0)
    inoremap <C-ScrollWheelDown> <Esc>:call AdjustFontSize(-1)<CR>a

    " In normal mode, pressing numpad's+ increases the font
    noremap <c-+> :call AdjustFontSize(1)<CR>
    noremap <c-_> :call AdjustFontSize(-1)<CR>
    noremap <c--> :call AdjustFontSize(-1)<CR>

    " In insert mode, pressing ctrl + numpad's+ increases the font
    inoremap <c-+> <Esc>:call AdjustFontSize(1)<CR>a
    inoremap <c--> <Esc>:call AdjustFontSize(-1)<CR>a

    call AdjustFontSize(0)
endif

" lua print(vim.opt.guifont._value)
" set guifont=*

map! <S-Insert> <C-R>+
