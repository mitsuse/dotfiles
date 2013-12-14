"" standard vim commands
nnoremap ;h :help<space>
nnoremap ;t :tabnew<space>
nnoremap ;n :noh<CR>
nnoremap ;w :w
nnoremap ;q :q

"" unite
nnoremap zn :UniteWithBufferDir -buffer-name=files file file/new<CR>
nnoremap zh :Unite file_mru<CR>

"" sonictemplate-vim
nnoremap ;g :Template<space>
