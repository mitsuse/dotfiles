"" standard vim commands
nnoremap ;h :help<space>
nnoremap ;t :tabnew<space>
nnoremap ;w :w
nnoremap ;q :q
nmap <silent> <Esc><Esc> :nohlsearch<CR>

"" unite
nnoremap zn :UniteWithBufferDir -buffer-name=files file file/new<CR>
nnoremap zh :Unite file_mru<CR>

"" sonictemplate-vim
nnoremap ;g :Template<space>
