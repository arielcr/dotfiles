" =========================== PLUGINS ============================

" Install vim-plug for vim and neovim
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'                               " Sensible defaults
Plug 'dawikur/base16-gruvbox-scheme'                    " Gruvbox Theme
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } " File navigator
Plug 'editorconfig/editorconfig-vim'                    " Support for editor config
Plug 'neoclide/coc.nvim', {'branch': 'release'}         " Intelisense and much more!
Plug 'vim-airline/vim-airline'                          " Cool status bar
Plug 'vim-airline/vim-airline-themes'
Plug 'jlanzarotta/bufexplorer'                          " Buffer explorer
Plug 'tpope/vim-fugitive'                               " Git support
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }     " Install fuzzy finder binary
Plug 'junegunn/fzf.vim'                                 " Enable fuzzy finder in Vim
Plug 'preservim/nerdcommenter'                          " Easily comment code 
"Plug 'airblade/vim-gitgutter'                           " Display git status on code 
"Plug 'mileszs/ack.vim'                                  " For searching
Plug 'preservim/tagbar'                                 " View file methods
Plug 'tpope/vim-obsession'                              " Save project session
Plug 'dhruvasagar/vim-prosession'
Plug 'puremourning/vimspector'                          " Debugger
Plug 'tpope/vim-unimpaired'                             " Easy shortcuts with []
Plug 'Raimondi/delimitMate'                             " Auto insert brackets
Plug 'justinmk/vim-sneak'                               " Jump to two char search
Plug 'mg979/vim-visual-multi', {'branch': 'master'}     " Multicursor editing
Plug 'kshenoy/vim-signature'                            " Manage marks
Plug 'junegunn/vim-easy-align'                          " Align code
Plug 'wincent/ferret'                                   " Search
call plug#end()

" =========================== THEMES ============================
autocmd vimenter * ++nested colorscheme gruvbox
let g:gruvbox_contrast_dark='hard'

" =========================== CONFIGURATION ============================
set nocompatible
set number                                          " Show numbers on the left
set hlsearch                                        " Highlight search results
set ignorecase                                      " Search ingnoring case
set smartcase                                       " Do not ignore case if the search patter has uppercase
set noerrorbells                                    " I hate bells
set belloff=esc
set tabstop=4                                       " Tab size of 4 spaces
set softtabstop=4                                   " On insert use 4 spaces for tab
set shiftwidth=4
set expandtab                                       " Use apropiate number of spaces
set nowrap                                          " Wrapping sucks (except on markdown)
set cursorline                                      " Display cursor line
set noswapfile                                      " Do not leve any backup files
set clipboard=unnamed,unnamedplus                   " Use the OS clipboard
set showmatch
set showmode
set termguicolors
set splitright splitbelow
set relativenumber
set noshowmode

" Fix for CoC not highlighting
set redrawtime=10000

let &t_SI = "\e[6 q"                                " Make cursor a line in insert
let &t_EI = "\e[2 q"                                " Make cursor a line in insert
let mapleader = ","

" Fix tmux theme issue
let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"

" Airline Config
let g:airline_theme='term'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tagbar#enabled = 1
"let g:airline#extensions#tagbar#flags = '' 
"let g:airline#extensions#tagbar#flags = 'f'
"let g:airline#extensions#tagbar#flags = 's'
"let g:airline#extensions#tagbar#flags = 'p'

" NERD Tree Config
let NERDTreeHijackNetrw = 0
let NERDTreeShowBookmarks = 1
let NERDTreeShowHidden = 1
let NERDTreeBookmarksDort = 1
let NERDTreeMinimalUI = 0
let NERDTreeAutoCenter = 1
let NERDTreeQuitOnOpen = 1
let NERDTreeStatusline = 0
"let g:NERDTreeIgnore=['.git','.idea']

" Buffer explorer Config
let g:bufExplorerShowRelativePath=1 

" Use ag instead of ack for search
let g:ackprg = 'ag --nogroup --nocolor --column'

" Debug with function keys 
let g:vimspector_enable_mappings = 'HUMAN'

" GO Highlight config
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 12

" Fuzzy findeer mappings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-i': 'split',
  \ 'ctrl-v': 'vsplit' }

let g:fzf_layout = { 'down':  '40%'}
let g:fzf_preview_window = []

" Don't bind ferret commands.
let g:FerretMap = 0

" Don't hide cursor line in quickfix.
let g:FerretQFOptions = 0
let g:FerretVeryMagic = 0

" =========================== MAPPERS ============================

" Bind our own Ferret commands.
nmap <leader>/ <Plug>(FerretAck)
nmap <leader>r <Plug>(FerretAcks)
nmap <leader>* <Plug>(FerretAckWord)

" Copy current file name
nnoremap <Leader>cf :let @+=expand('%:t')<CR>

" Close all buffers except current one
nnoremap <Leader>xb :%bdelete<CR>

" Shortcut for Ack
"cnoreabbrev Ack Ack!
"nnoremap <Leader>/ :Ack!<Space>

" Map scroll keys
nmap <C-J> <C-e>
nmap <C-K> <C-y>

" Simpler mappers to switch between splits
"nmap <C-J> <C-W><C-J>
"nmap <C-K> <C-W><C-K>
"nmap <C-H> <C-W><C-H>
"nmap <C-L> <C-W><C-L>

" Close current buffer
map <C-x> :bd<CR>

" Close all buffers
nmap <Leader>x :bufdo bd!<CR>

" GIT
nmap <Leader>g :G<Space>

" Add simple highlight removal
nmap <Leader><space> :nohlsearch<cr>

" Make it easy to edit the Vimrc file.
nmap <Leader>rc :sp ~/.vimrc<cr>
 
" Move Visual blocks with J an K
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Cycle between buffers
nnoremap <C-l> :bn<CR>
nnoremap <C-h> :bp<CR>

" Toggle tagbar
nmap <Leader>m :TagbarOpenAutoClose<CR>
"nmap <S-F8> :TagbarToggle<CR>

" Format json
nmap <Leader>fj :%!jq .<CR>

" Close all splits except the current one
nmap <Leader>qw :only <CR>

" Display the terminal
nnoremap <Leader>t :terminal<CR>

" Autocomplete braces
"inoremap ( ()<left>
"inoremap [ []<left>
"inoremap { {}<left>
"inoremap {<CR> {<CR>}<ESC>O
"inoremap {;<CR> {<CR>};<ESC>O

"Save all shortcut
nmap <Leader>` :wa<CR>

" View all buffers
nmap <C-u> :Buffers<CR>

" Open empty buffer on left split
nmap <Leader>= :vne<CR>

" Search for files
nnoremap <C-p> :Files<cr>

" NERD Tree
map <F7> :NERDTreeToggle <cr>
map <leader>nf :NERDTreeFind<cr>

" Git
nnoremap <Leader>b :Git blame<CR>

" Reset debugger
nnoremap <Leader>vr :VimspectorReset<CR>
nnoremap <Leader>vc vimspector#ClearBreakpoints()<CR>

" CoC Diagnostic current file
nnoremap <Leader>cd :CocDiagnostics<CR>

nnoremap <silent><nowait><Leader>e :BufExplorer<CR>

" Go back to normal mode in terminal mode
tnoremap <Esc> <C-\><C-n>

" In insert or command mode, move normally by using Ctrl
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <Right>

" Map delete key
inoremap <C-d> <Del>

" Switch between the last two files
nnoremap <Leader><Leader> <C-^>

" Create new splits
nnoremap <Leader>v <C-w>v
nnoremap <Leader>h <C-w>s

" Resize splits more quickly
nmap <Leader>7 :res +2<CR>  
nmap <Leader>8 :res -2<CR> 
nmap <Leader>9 :vertical res +2<CR> 
nmap <Leader>0 :vertical res -2<CR> 

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Send escape key to terminal mode
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <C-v><Esc> <Esc>
endif

" The following lets you type Ngb to jump to buffer number N (a number from 1 to 99)
" For example, typing 12gb would jump to buffer 12.
let c = 1
while c <= 99
  execute "nnoremap " . c . "b :" . c . "b\<CR>"
  let c += 1
endwhile

" =========================== AUTOCOMMANDS ============================

" Autocomand to remember las editing position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

" DO wrap on markdown files
autocmd BufRead,BufNewFile *.md,*.txt setlocal wrap 

"Automatically source the Vimrc file on save.
if has ('autocmd')          " Remain compatible with earlier versions
 augroup Reload_Vimrc       " Group name.  Always use a unique name!
    autocmd! BufWritePost ~/.vimrc source % | redraw
    autocmd! BufWritePost $MYGVIMRC if has('gui_running') | so % | echom "Reloaded " . $MYGVIMRC | endif | redraw
  augroup END
endif " has autocmd

autocmd BufRead,BufNewFile Jenkinsfile set filetype=groovy
" =========================== CoC Configuration =========================

" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
"set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

let g:coc_global_extensions = [
    \ 'coc-tsserver',
    \ 'coc-json',
    \ 'coc-html',
    \ 'coc-css',
    \ 'coc-phpls',
    \ 'coc-python',
    \ 'coc-go',
	\ 'coc-diagnostic'
    \]

