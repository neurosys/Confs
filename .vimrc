"
" Rather rarely used stuff
"
" Nice colorschemes
    " -------------------------------------------------------------------------------
    " bclear (white background, low contrast)
    " blacksea (black background, high contrast)
    " chela_light (white background, medium contrast)
    " darkZ (grey background, medium contrast), nice colors for c++
    " darkbode (black backdround, medium contrast) nice colors for c++
    " darkspectrum (grey background, medium contrast) almost nice for c++
    " delek (white background, high contrast) ... original pack
    " desert (grey background, high contrast) good for c++
    " earendel (grey bg, medium contrast)
    " evening (grey bg, medium contrast) wierd string highlighting
    " jellybeans (grey bg, medium contrast) ok for codding... bad for text
    " mustang (grey bg, medium contrast) ok for codding... bad for text
    " rootwater (grey bg, medium contrast) ok for coding

" Ctags
    " -------------------------------------------------------------------------------
    " :tag /<partial symbol name> 
    " Searches for <partial symbol name> trough the tag list (regexp can be applyed)
    " 
 
" Highlight <pattern> with the settings for this <class>
    " -------------------------------------------------------------------------------
    " :match <class> /<pattern>/
    " :2match <class> /<pattern>/
    " :3match <class> /<pattern>/
    "
    " there are only 3 matches (should be enough) and the classes can be:
    "   - error
    "   - normal (no higlight)
    "   - comment
    "   - todo
    " I think I can define more of them using the sintax files
    "

" Composite search
    " -------------------------------------------------------------------------------
    " /<pattern1>/;/<pattern2>/
    " This will search for <pattern1>, jump to that possition, and from there
    " it will jump to the next ocurence of <pattern2>
    "
    " Obs! hitting n or p after that, won't trigger a new composite search of
    " the same type, but will search again for <pattern2>
    "
    "

" Vimdiff
    " -------------------------------------------------------------------------------
    " At the command line, enter:
    " vimdiff file1 file2
    " to compare the differences between to files.
    " For multiple files, see type "man vimdiff" into a terminal.
    "
    " ]c          - next difference
    " [c          - previous difference
    " Ctrl+ww     - switch windows
    " do          - diff obtain
    " dp          - diff put
    " zo          - open folded text
    " zc          - close folded text
    " :diffupdate - re-scan the files for differences

" Smart replaces
    " -------------------------------------------------------------------------------
    " :%s/\(<pattern>\)/\1<something else>/
    "
    " 1. define \(<pattern\) as attom 1
    " 2. replace attom 1 with itself \1 followed by <something>else
    "
    "
" Case sensitive searches
    " -------------------------------------------------------------------------------
    " By default we turned off case sensitive searches, so to enable them for
    " a particular search prefix the pattern with \C
    " When including a \c the search is case insensitive

" Selective save
    " -------------------------------------------------------------------------------
    " <x>,<y>w saves only the changes made between lines <x> trough <y>

" cmap
    " -------------------------------------------------------------------------------
    " cmap makes mappings for the command line :-)
    "
" command
    " Creates a new command (command name must begin with capital letter)
    " command Functionlist !ctags -x %

" Special navigation
    " -------------------------------------------------------------------------------
    " <nr>%               - Jumps to <nr>% for example 50% jumps at half the file
    " <nr>|               - jumps to the <nr> column on that line
    " <C-f>               - Forward one screen
    " <C-b>               - Backward one screen
    " '' sau ``           - Gets back to the possition before a jump
    " [{                  - Jumps to the begining of the current block
    " ]}                  - Jumps to the ending of the current block
    " '[                  - Jumps to text just changed
    " ']                  - Jumps to text just changed
    " '<                  - Jumps to text just changed
    " '>                  - Jumps to text just changed

" Misc
    " -------------------------------------------------------------------------------
    " zz                  - Redraws and sets the cursor in the center of the screen
    " g*                  - Searches for the current word, but not only as a distinct
    "                           word but also as part of other words
    " g#                  - Same as g* but in the opposite direction
    " <TAB>               - Same as <C-I>
    " g<C-g>              - Shows a detailed info about the currsor possition
    " "*y                 - Copy to clipboard
    " "*p                 - Paste from cliboard
    " "<capital letter>yy - Append the line yanked to register <letter>
    " q<capital letter>   - Appends to macro recorded in register <letter>
    " C-x C-] (insert)    - Autocomplete from the ctags file ;-)
    "
    " :map                - Lists all normal mod mappings
    " :unmap              - Removes a map made with map (Similar for the others)
    " :verbose map        - Detailed list with all mappings for normal mode
    " :verbose imap       - Detailed list with all mappings for insert mode
    " :jumps              - List with all the jumps made
    " :options            - Opens a buffer with all the current configurations
    "                           also has small comments about them
    "                           you can also directly edit this file at
    "                           runtime
    " :syntax clear       - Turns of syntax higlight (useful for speed)
    "
    " :set scrollbind     - Scroll all the windows at the same time
    "
	"dl"	delete character (alias: "x")		|dl|
	"diw"	delete inner word			*diw*
	"daw"	delete a word				*daw*
	"diW"	delete inner WORD (see |WORD|)		*diW*
	"daW"	delete a WORD (see |WORD|)		*daW*
	"dd"	delete one line				|dd|
	"dis"	delete inner sentence			*dis*
	"das"	delete a sentence			*das*
	"dib"	delete inner '(' ')' block		*dib*
	"dab"	delete a '(' ')' block			*dab*
	"dip"	delete inner paragraph			*dip*
	"dap"	delete a paragraph			*dap*
	"diB"	delete inner '{' '}' block		*diB*
	"daB"	delete a '{' '}' block			*daB*

" Debug
    " -------------------------------------------------------------------------------
    " :map                - Lists all normal mod mappings
    " :imap               - Lists all insert mod mappings
    " :cmap               - Lists all cmd line mappings
    " :marks              - List with all active marks
    " :script             - Displays in order all the scripts that vim has executed


" Registers
    " -------------------------------------------------------------------------------
    " To show the content of the registers use :reg
    " " Unnamed register, containing the text of the last delete or yank
    " % Current filename
    " # Alternate file name (Full path)
    " * Clipboard contents (X11: primary selection)
    " + Clipboard contents/Last search pattern
    " : Last command-line
    " . Last inserted text
    " - Last small (less than a line) delete
    " = Launches a vim function, ofcourse, you can always use system() to pull
    "       out something from the output of a command:
    "       <C-R>=system('ls -1')<C-R>

" g mode
    " -------------------------------------------------------------------------------
    " :[range]g /<pattern>/ <cmd> - executes <cmd> on all the lines from the
    "       [range] that have <pattern> on them, if ! is pressent after g, the
    "       <cmd> will be executed on the lines that don't contain the <pattern>
    "
    " useful cmds:
    "       l (small L) list
    "       y <register> yank in <register>
    "       d delete
    "       normal <normal mode cmds> executes <normal mode cmds>
    "           on each of the lines that contain <pattern>
    "       s/<to be replaced>/<replacement>/ replaces <to be replaced> with
    "           <replacement>

" Moving windows
    " --------------------------------------------------------------------------------
    " - C-w K moves the current window as top horizonta
    " - C-w J moves the current window as bottom-orizontal
    " - C-w L moves the current window as left-vertical
    " - C-w H moves the current window as right-vertical
    "
    " - :set winwidth=<nr> seteaza latimea ferestrei curente la <nr>
    " - :set winheight=<nr> seteaza inaltimea ferestrei curente la <nr>

" File Browser
    " --------------------------------------------------------------------------------
    "  :Vex opens a vertical list of files in the folder containing the
    "       current eddited file
    "  %    pressed in the file browser window, creates a new file for editing
    "       putting it in the current explored folder
    "  t    pressed in the file browser window, opens the selected file in a
    "       new tab and selects the tab
    "  T    pressed in the file browser window, opens the selected file in a
    "       new tab but doesn't selects the tab
    "  d    pressed in the file browser window, creates a new directory

set nocompatible
"behave mswin

if has("win32unix")
"set runtimepath = ~/.vim,
    "set runtimepath=~/vimfiles,$VIMRUNTIME
 "   set runtimepath+=c:/Users/NeuroSys/vimfiles
 "   set runtimepath+=~/vimfiles
endif

if has("unix")
    " Nothing for the moment
endif

if has("win32")
    " Nothing for the moment
endif

"set diffexpr=MyDiff()
"function MyDiff()
"  let opt = '-a --binary '
"  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
"  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
"  let arg1 = v:fname_in
"  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
"  let arg2 = v:fname_new
"  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
"  let arg3 = v:fname_out
"  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
"  let eq = ''
"  if $VIMRUNTIME =~ ' '
"    if &sh =~ '\<cmd'
"      let cmd = '""' . $VIMRUNTIME . '\diff"'
"      let eq = '"'
"  else
"      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
"    endif
"  else
"    let cmd = $VIMRUNTIME . '\diff'
"  endif
"  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
"endfunction

function FunctionList()
    :pedit "List of functions for %s"
    C-w j
    :r! ctags -x %
    C-w k
endfunction

"""""""""""""""""""""""""""""""""""""""""""""
" Aspect and general behaviour (no mappings)
"""""""""""""""""""""""""""""""""""""""""""""

if has("gui")
    " Specify a nicer layout
    au GUIEnter * set lines=48 columns=94
    " Still, by default we should open inf full screen
    au GUIEnter * simalt ~x

    " Set the color schema
    "color darkZ
    "color elflord
    "color slate
    "color molokai
    color default

    " Sugest use of collors that look good on white backrgounds
    set background=light

    " Use a nicer font
    ":set guifont=ProggyCleanTT_CE:h12
    ":set guifont=Ubuntu_Mono:h12:cANSI
    :set guifont=Ubuntu_Mono:h9:cANSI

    " No menu and tab bar
    :set guioptions=

    " Alt-Space is System menu
    noremap <M-Space> :simalt ~<CR>
    inoremap <M-Space> <C-O>:simalt ~<CR>
    cnoremap <M-Space> <C-C>:simalt ~<CR>

    " Paste in insert mode
    cmap <C-V> <C-R>+
    exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
else
    " Sugest use of collors that look good on dark backrgounds
    set background=dark
    color elflord
endif

" Windows
" Use a nicer font
":set guifont=ProggyCleanTT_CE:h12
"
" Linux
":set guifont=Andale\ Mono\ 10
":set guifont=Courier\ New\ 12
":set guifont=DejaVu\ Sans\ Mono\ 10
":set guifont=Liberation\ Mono\ 10
":set guifont=Monospace\ 12
":set guifont=Ubuntu\ Mono\ 12
"
"

" No bell, now flashes, NO FUCKING THING !!!!
:set noerrorbells
:set visualbell
:set vb t_vb=

" We need line numbers
:set nu is

" All tabs must have 4 spaces ONLY !!!!
:set ts=4
:set st=4
:set sw=4

" define custom collors for things
if !exists("autocmd_colorscheme_loaded")
    let autocmd_colorscheme_loaded = 1

    autocmd ColorScheme * highlight TodoRed      ctermbg=DarkGreen guibg=#002b37 ctermfg=LightRed     guifg=#E01B1B
    autocmd ColorScheme * highlight TodoOrange   ctermbg=DarkGreen guibg=#002b37 ctermfg=LightMagenta guifg=#E0841B
    autocmd ColorScheme * highlight TodoYellow   ctermbg=DarkGreen guibg=#002b37 ctermfg=LightYellow  guifg=#E0D91B
    autocmd ColorScheme * highlight MyTodo   ctermbg=LightGrey guibg=#002b37 ctermfg=LightYellow  guifg=#E0D91B

    autocmd ColorScheme * highlight match    ctermbg=White     guibg=White  ctermfg=DarkBlue  guifg=DarkBlue
    autocmd ColorScheme * highlight 2match   ctermbg=Blue      guibg=Blue   ctermfg=White     guifg=White
    autocmd ColorScheme * highlight 3match   ctermbg=Green     guibg=Green  ctermfg=Black     guifg=Black

endif
" Available terminal colors:
" - Black
" - DarkBlue
" - DarkGreen
" - DarkCyan
" - DarkRed
" - DarkMagenta
" - Brown, DarkYellow
" - LightGray, LightGrey, Gray, Grey
" - DarkGray, DarkGrey
" - Blue, LightBlue
" - Green, LightGreen
" - Cyan, LightCyan
" - Red, LightRed
" - Magenta, LightMagenta
" - Yellow, LightYellow
" - White



" Define a set of todos, based on the custom colorschemes

" TODO
" TODO1
" TODO2
" TODO3

if has("autocmd")
    if v:version > 701
        autocmd Syntax * call matchadd('TodoRed',  '\W\zs\(TODO1\)')
        autocmd Syntax * call matchadd('TodoOrange', '\W\zs\(TODO2\)')
        autocmd Syntax * call matchadd('ToDoYellow', '\W\zs\(TODO3\)')
        autocmd Syntax * call matchadd('MyTodo', '\W\zs\(elflord\)')

        autocmd Syntax * call matchadd('match',  '\(TODO1\)')
        autocmd Syntax * call matchadd('2match', '\(TODO2\)')
        autocmd Syntax * call matchadd('3match', '\(TODO3\)')
        "autocmd Syntax * call matchadd('3match', '\W\zs\(TODO3\)')
    endif
endif

" Do not wrap lines (useful in 60% cases, very annoying in rest)
set nowrap

" I want search highlithing on
set hls

" Simulate Alt pressing (sincer nu stiu la ce-mi foloseste)
set si is

" Use line number when printing (on paper)
set printoptions=number:y

" Use spaces instead of tabs
set expandtab

" Use fast grep for searching
":set grepprg=fg
set grepprg=egrep

" Ignore case when searching
set ignorecase

" Use smartcase when searching (if searched string is lowercase => ignore
" case, if upercase " pressent => case sensitive)
set smartcase

" Use incremental search
set incsearch

" When searching, after reaching the end of the file, continue from the begining
set wrapscan

" When in insert mode, I want to be able to backspace things entered in other
" sessions
set backspace=indent,eol,start

" Show incomplete commands
set showcmd

" When a bracket is inserted, briefly jump to the matching one
set showmatch

" When a file is changed outside of vim, reload it
set autoread

" Atempt to determine the type of a file based on its name and posibly by
" content
filetype on
filetype plugin on
filetype indent plugin on

" Instead of failing my commands because of unsaved info, ask for my
" confirmation
set confirm

" Command line completion
set wildmenu
set wildmode=list:full

" Auto complete
set completeopt=menu,longest,preview


" Stop folding
set nofoldenable

" Highlight redundant whitespaces and tabs at the end of the line
highlight RedundantSpaces ctermbg=red guibg=red
match RedundantSpaces /\s\+$\| \+\ze\t\|\t/

" Allow buffer switching without write
set hidden

" Remember more commands in history (default 20)
set history=100

if v:version > 702
    " Highlight columns 80, 120, 130
    "set colorcolumn=80,120,130
endif


" Let me choose how long a text line can be (by default 78)
set textwidth=0

" In insert mode display tabs as >-
":set listchars=tab:>-,trail:-

" Set persistent-undo
" undofile

" When splitting, put the new split below, or at right
:set splitbelow
:set splitright

" Highlight the current line, but only in the current window
"au WinEnter * setlocal cursorline
":setlocal cursorline
"au WinLeave * setlocal nocursorline

" Leave insert mode after 15 seconds of no imput
au CursorHoldI * stopinsert
au InsertEnter * let updaterestore=&updatetime | set updatetime=15000
au InsertLeave * let &updatetime=updaterestore

" start scrolling when within 0 lines near the top/bottom
set scrolloff=0

" Spelling en_us maybe sometimes... ro
command Spell setlocal spell spelllang=en_us


" allow freeform selection (i.e. ignoring line endings) in visual block mode
set virtualedit+=block

" Automaticaly load cscope.out if pressent
:cs add cscope.out

" Look for the tags file, up in the folder hierachy
set tags=vtags;/

" Walk trough buffers
:map <M-j> :bnext<Enter>
:map <M-k> :bprevious<Enter>
:map <M-h> :buffers<Enter>

"autocmd syn *.c

" <in c match these operators too>
" autocmd BufRead,BufNew *.c,*.C,*.h,*.H,*.cpp,*.CPP,*.hpp,*.HPP syn match       cOperator       "?"
" autocmd BufRead,BufNew *.c,*.C,*.h,*.H,*.cpp,*.CPP,*.hpp,*.HPP syn match       cOperator       "\~"
" autocmd BufRead,BufNew *.c,*.C,*.h,*.H,*.cpp,*.CPP,*.hpp,*.HPP syn match       cOperator       "%"
" autocmd BufRead,BufNew *.c,*.C,*.h,*.H,*.cpp,*.CPP,*.hpp,*.HPP syn match       cOperator       "\^"
" autocmd BufRead,BufNew *.c,*.C,*.h,*.H,*.cpp,*.CPP,*.hpp,*.HPP syn match       cOperator       "[^/*]/[^/*]"
" autocmd BufRead,BufNew *.c,*.C,*.h,*.H,*.cpp,*.CPP,*.hpp,*.HPP syn match       cOperator       "="
" autocmd BufRead,BufNew *.c,*.C,*.h,*.H,*.cpp,*.CPP,*.hpp,*.HPP syn match       cOperator       "+"
" autocmd BufRead,BufNew *.c,*.C,*.h,*.H,*.cpp,*.CPP,*.hpp,*.HPP syn match       cOperator       "-"
" autocmd BufRead,BufNew *.c,*.C,*.h,*.H,*.cpp,*.CPP,*.hpp,*.HPP syn match       cOperator       "!"
" autocmd BufRead,BufNew *.c,*.C,*.h,*.H,*.cpp,*.CPP,*.hpp,*.HPP syn match       cOperator       ">"
" autocmd BufRead,BufNew *.c,*.C,*.h,*.H,*.cpp,*.CPP,*.hpp,*.HPP syn match       cOperator       "<"
" autocmd BufRead,BufNew *.c,*.C,*.h,*.H,*.cpp,*.CPP,*.hpp,*.HPP syn match       cOperator       ";"
" autocmd BufRead,BufNew *.c,*.C,*.h,*.H,*.cpp,*.CPP,*.hpp,*.HPP syn match       cOperator       "&"
" autocmd BufRead,BufNew *.c,*.C,*.h,*.H,*.cpp,*.CPP,*.hpp,*.HPP syn match       cOperator       "*"
" autocmd BufRead,BufNew *.c,*.C,*.h,*.H,*.cpp,*.CPP,*.hpp,*.HPP syn match       cOperator       "|"
" autocmd BufRead,BufNew *.c,*.C,*.h,*.H,*.cpp,*.CPP,*.hpp,*.HPP syn match       cOperator       "{"
" autocmd BufRead,BufNew *.c,*.C,*.h,*.H,*.cpp,*.CPP,*.hpp,*.HPP syn match       cOperator       "}"
" autocmd BufRead,BufNew *.c,*.C,*.h,*.H,*.cpp,*.CPP,*.hpp,*.HPP syn match       cOperator       ","
" autocmd BufRead,BufNew *.c,*.C,*.h,*.H,*.cpp,*.CPP,*.hpp,*.HPP syn match       cOperator       "\."
" autocmd BufRead,BufNew *.c,*.C,*.h,*.H,*.cpp,*.CPP,*.hpp,*.HPP syn match       cOperator       "\["
" autocmd BufRead,BufNew *.c,*.C,*.h,*.H,*.cpp,*.CPP,*.hpp,*.HPP syn match       cOperator       "\]"
" autocmd BufRead,BufNew *.c,*.C,*.h,*.H,*.cpp,*.CPP,*.hpp,*.HPP syn match       cOperator       "("
" autocmd BufRead,BufNew *.c,*.C,*.h,*.H,*.cpp,*.CPP,*.hpp,*.HPP syn match       cOperator       ")"
autocmd BufRead,BufNew *.c,*.C,*.h,*.H,*.cpp,*.CPP,*.hpp,*.HPP syn match       cOperator       "[\+\->=!<?;~\^\(\)\[\]:}{,\.\|&\*%~]"
autocmd BufRead,BufNew *.c,*.C,*.h,*.H,*.cpp,*.CPP,*.hpp,*.HPP syn match       cOperator       "[^/*]/[^/*]"
" </in c match these operators too>

" <backup zone>
    " If pressent, store backup files in ".backup"
    :set backupdir=.\.backup,.,\tmp
    :set directory=.,.\.backup,\tmp

    " No persistent backup
    :set nobackup

    " Make a bakup before overwriting a file, after overwriting succedes, remove backup
    :set writebackup

    " Write a backup file for each change we make in the file (triggered at :w)
    " XXX DANGEROUS XXX after 30 minutes of work, you could end up with lots of files
    "au BufWritePre * let &bex = '-' . strftime("%Y-%m%d_%H-%M-%S") . '.vimbackup'

    " Make a backup of the original file, if <filename>.origina_file doesn't
    " exists it's created, if it does, it goes on with <filename>~ files
    ":set patchmode=.original_file
" </backup zone>

" <folding>
    " Stop folding
    set nofoldenable

    "set foldmethod=marker
    "foldmarker, so Vim will know where to fold
    "set foldmarker={{{,}}}
    "folding marker, for automatic folding
    "imap <F1> 0i/* {{{ $a */
    "imap <F2> 0i/* }}} $a */
" <folding>


" <VimWiki settings>
    " Don't make links from words in camel case
    let vimwiki_camel_case=0

    " Stop folding
    let vimwiki_folding=0

    "let g:vimwiki_list = [{'path': 'C:/Documents and Settings/camza.AYADOM/vimwiki/'}]
    "let g:vimwiki_list = [{'path': '~/.vimwiki/'}]
    " ????
    let vimwiki_list_ignore_newline=0
" </VimWiki settings>


" <Taglist>
    " Move taglist on the right side
    let Tlist_Use_Right_Window=1

    " Display prototypes instead of other bullshit
    let Tlist_Display_Prototype=1

    " A wider taglist window
    let Tlist_WinWidth=90

    " Display only tags for current file
    let Tlist_Show_One_File=1

    :map <F12> :TlistToggle<Enter>
" </Taglist>

" <NERD tree>
    " Turn off NERDTree
    let loaded_nerd_tree=0

    :map <F11> :NERDTreeToggle<Enter>

    " Use colors
    let NERDChristmasTree=1

    " Don't change the current directory of vim
    let NERDTreeChDirMode=0

    " Higlight the current currsor line
    let NERDTreeHighlightCursorline=1

    " Show hidden files
    let NERDTreeShowHidden=1

    let NERDTreeWinPos="right"

    let NERDTreeWinSize=50

" <NERD tree>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"                                    Key Mapings
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" <ctags>
    " <C-\> Open item in a new tab
    map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
    " <A-]> Open item in a vertical split
    map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
    " display prototype in preview window
    map <M-i> <C-w>}
    "map <F8> :sp <CR>:exec("tag ".expand("<cword>"))<CR>
    map <F8> :ptag <C-R>=expand("<cword>")<CR><Enter>
" </ctags>




" <cscope>
    " Easyer method to find files
    nmap <M-f> :cs find f 
    " Find this C symbol
    nmap <M-s> :cs find s <C-R>=expand("<cword>")<CR><CR>
    " Find this definition
    nmap <M-g> :cs find g <C-R>=expand("<cword>")<CR><CR>
    " Find functions calling this function
    nmap <M-c> :cs find c <C-R>=expand("<cword>")<CR><CR>
    " Find assignments to
    "nmap <M-t> :cs find t <C-R>=expand("<cword>")<CR><CR>
    " Find egrep pattern
    "nmap <M-e> :cs find e <C-R>=expand("<cword>")<CR><CR>
    " Find file
    "nmap <M-f> :cs find f <C-R>=expand("<cfile>")<CR><CR>
    " Find files including this file
    "nmap <M-i> :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    " Find functions called by this function
    "nmap <M-d> :cs find d <C-R>=expand("<cword>")<CR><CR>
" </cscope>


" <enhance browsing>
    " Scroll screen up and down
    :map <C-j> <C-e>
    :map! <C-j> <C-e>
    :map <C-k> <C-y>
    :map! <C-k> <C-y>
" </enhance browsing>


" <replace tab with ^>
" (normal mode) for easier jump to the beginig of the line
    ":map <Tab> ^
" <replace tab with ^>

" <grep results browsing>
" Jump to previous result in the local list
:map <C-h> :lp<Enter>
:map! <C-h> <Esc>:lp<Enter>

" Jump to next result in the local list
:map <C-l> :lne<Enter>
:map! <C-l> <Esc>:lne<Enter>

:map \h :lgrep -i <C-R>=expand("<cword>")<CR>  --include=*.h .<Enter>
:map \H :lgrep <C-R>=expand("<cword>")<CR>  --include=*.h .<Enter>
:map \c :lgrep -i <C-R>=expand("<cword>")<CR>  --include=*.cpp .<Enter>
:map \C :lgrep <C-R>=expand("<cword>")<CR>  --include=*.cpp .<Enter>
:map \a :lgrep -i <C-R>=expand("<cword>")<CR>  --include=*.h --include=*.cpp .<Enter>
:map \A :lgrep <C-R>=expand("<cword>")<CR> --include=*.h --include=*.cpp . <Enter>
:map \t :lgrep <C-R>=expand("<cword>")<CR> . <Enter>
:map \T :lgrep <C-R>=expand("<cword>")<CR> . <Enter>

" Jump to previous result in the quickfix list
":map <F9> :cp<Enter>
":map! <F9> <Esc>:cp<Enter>


" <abreviations>
:ab pt pentru 

"
:ab --- ------------------------------------------------------------------------------- 
:ab === ===============================================================================

" When opening a bracket, we must close it too
:map! {} {<Enter>}<Esc>O
" </abreviations>




" <put traces in code>
" Add traces to c++ code ;-)
"let @z=0
"let @x=''

" Add call to dexdbgn, using the file name and the function name
":map <F1> :let @z=@z+1<Enter>Odexdbgn("<C-R>z", "<C-R>%", "<C-R>x()");<Esc>==:s;\\;\\\\;g<Enter>:nohls<Enter>

" Add a template monitor message
":map <F1> oMONITOR->Print(_T("DEXTRACE:>> "));<Esc>

" Store the name of the current function (you must be over it)
":map <F2> :let @x='<C-R><C-W>'<Enter>

" Add #include "C:/dexdbg.h" to the current file
":map <F4> ggi#include "C:/dexdbg.h"<Enter><Esc>
" </put traces in code>



" Because of accidental :W, let's set it as an allias to :w
nmap :W :w

" ZZ is not the way I like to exit vim (i use zz to redraw the screen)
map ZZ zz

" Clear highligts for the searches (does not affect the multi search part, for
" that use :SearchReset)
":map <F5> :nohls<Enter>

" Multi search shortcut
" :map <F3> :Search <C-r><C-w><Enter>

" I'll add write permissions for this files, bitches love write permissions
:map <F9> :! chmod +w %<Enter>
:imap <F9> <Esc>:! chmod +w %<Enter>

:map <F1> :tab split<Enter>
:imap <F1> :tab split<Enter>



" PYTHON ZONE ----------------
"function! PutMyTraces(file_name, function_name)
"python << EOF
"#" truc, asa pot folosi sintaxa aferenta cand editez cod python
"import vim
"import imp
"
"module = imp.load_source("tracer", "C:\\Program Files\\Vim\\tracer.py");
"
"def executor(function_name):
"    a = module.Tracer(vim.current.buffer.name, function_name)
"    a.TraceThisFunction()
"    a.AddInclude(vim.current.buffer)
"
"def test_executor(function_name):
"    cur_buf = vim.current.buffer
"    cur_row, cur_col = vim.current.window.cursor
"    a = module.Tracer(vim.current.buffer.name, function_name)
"    a.AddTrace(cur_buf, cur_row - 1)
"EOF

"map <F1> :python PutMyTraces('<C-R>%', '<C-R><C-W>')<Enter>
"map <F1> :python executor('<C-R><C-W>')<Enter>
"map <F2> :python test_executor('<C-R><C-W>')<Enter>
" / PYTHON ZONE --------------

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Unknown options from vimrc_example.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""

" Don't use Ex mode, use Q for formatting
map Q gq

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" Taste libere de contract
" Q - pare sa fie asignat by default cu gq, adica sa sparga linia la
"   dimensiunea de 80 de caractere

" python << EOF
" import vim
" 
" CELL_SEPARATOR = "|"
" CELL_PADDING = " "
" 
" trim_cell_content = True
" add_line_separators = True
" 
" def vim_table():
"     table_text = []
"     buf = vim.current.buffer
"     buf_len = len(buf)
"     cursor_y, cursor_x = vim.current.window.cursor
"     current_line = cursor_y - 1
"     #print("current_line =", current_line)
"     while current_line < buf_len and CELL_SEPARATOR in buf[current_line]:
"         #print("current_line =", current_line)
"         table_text.append(buf[current_line].strip())
"         current_line += 1
" 
"     table = MakeTable(table_text)
" 
"     buf[0 : 0] = table
" 
" def DetermineMaxCellSizes(table):
"     max_cell_sizes = []
"     for line in table:
"         for i in range(0, len(line)):
"             cell_size = len(line[i])
"             # Test to see if we have a maximum for this column
"             if i >= len(max_cell_sizes):
"                 max_cell_sizes.append(cell_size)
"             else:
"                 max_cell_sizes[i] = max(max_cell_sizes[i], cell_size)
"     return max_cell_sizes
" 
" def GetLineSeparator(cell_sizes, intersection, line):
"     line_separator = []
"     #for cell in cell_sizes:
"     for i in range(0, len(cell_sizes) -1):
"         for j in range(0, cell_sizes[i]):
"             line_separator.append(line)
"         line_separator.append(intersection)
"     return "".join(line_separator) + "\n"
" 
" 
" def FormatTable(table, cell_sizes, separator, padding, add_line_separators):
"     str_table = []
"     line_sep = GetLineSeparator(cell_sizes, "+", "-")
"     for line in table:
"         str_table.append(line_sep)
"         new_line = ""
"         for i in range(0, len(cell_sizes) -1):
"             max_size = cell_sizes[i]
"             if len(line) > i:
"                 cell_size = len(line[i])
"                 new_line += line[i].ljust(max_size, padding) + separator
"             else:
"                 new_line += padding.ljust(max_size, padding) + separator
"         str_table.append(new_line)
"     str_table.append(line_sep)
"     return str_table
" 
" 
" # Split the text into cells
" def SplitTable(text, separator, strip_spaces):
"     table_cells = []
"     for line in text:
"         cells = line.split(separator)
"         if strip_spaces == True:
"             stripped_cells = []
"             for cell in cells:
"                 stripped_cells.append(cell.strip())
"             table_cells.append(stripped_cells)
"         else:
"             table_cells.append(cells)
"     return table_cells
" 
" 
" def MakeTable(text):
"     #print(text)
"     table = SplitTable(text, CELL_SEPARATOR, trim_cell_content)
"     #print(table)
"     max_sizes = DetermineMaxCellSizes(table)
"     #print(max_sizes)
"     return FormatTable(table, max_sizes, CELL_SEPARATOR, CELL_PADDING, add_line_separators)
" 
" EOF
" 
" map <F1> :python vim_table()<Enter>
