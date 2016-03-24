"=============================================================================
" FILE: git.vim
" AUTHOR:  Shougo Matsushita <Shougo.Matsu at gmail.com>
"          Robert Nelson     <robert@rnelson.ca>
" License: MIT license
"=============================================================================

" Global options definition. "{{{
call dein#util#_set_default(
      \ 'g:dein#types#git#command_path', 'git')
call dein#util#_set_default(
      \ 'g:dein#types#git#default_protocol', 'https')
call dein#util#_set_default(
      \ 'g:dein#types#git#clone_depth', 0)
call dein#util#_set_default(
      \ 'g:dein#types#git#pull_command', 'pull --ff --ff-only')
"}}}

function! dein#types#git#define() abort "{{{
  return s:type
endfunction"}}}

let s:type = {
      \ 'name': 'git',
      \ }

function! s:type.init(repo, option) abort "{{{
  if a:repo =~# '^/\|^\a:[/\\]' && s:is_git_dir(a:repo.'/.git')
    " Local repository.
    return { 'uri': a:repo, 'type': 'git', 'local': 1 }
  elseif isdirectory(a:repo)
    return {}
  endif

  let protocol = matchstr(a:repo, '^.\{-}\ze://')
  let name = substitute(a:repo[len(protocol):],
        \   '^://[^/]*/', '', '')
  let host = substitute(matchstr(a:repo[len(protocol):],
        \ '^://\zs[^/]*\ze/'), ':.*$', '', '')
  if host == ''
    let host = 'github.com'
  endif

  if protocol == ''
        \ || a:repo =~# '\<\%(gh\|github\|bb\|bitbucket\):\S\+'
        \ || has_key(a:option, 'type__protocol')
    let protocol = get(a:option, 'type__protocol',
          \ g:dein#types#git#default_protocol)
  endif

  if protocol !=# 'https' && protocol !=# 'ssh'
    call dein#util#_error(
          \ printf('Repo: %s The protocol "%s" is unsecure and invalid.',
          \ a:repo, protocol))
    return {}
  endif

  if a:repo !~ '/'
    " www.vim.org Vim scripts.
    let uri  = (protocol ==# 'ssh') ?
          \ 'git@github.com:vim-scripts/' :
          \ protocol . '://github.com/vim-scripts/'
    let uri .= name
  else
    let uri = (protocol ==# 'ssh') ?
          \ 'git@github.com:' . name :
          \ protocol . '://' . host . '/' . name
  endif

  if uri !~ '\.git\s*$'
    " Add .git suffix.
    let uri .= '.git'
  endif

  let directory = substitute(uri, '\.git$', '', '')
  let directory = substitute(directory, '^https:/\+\|^git@', '', '')
  let directory = substitute(directory, ':', '/', 'g')

  return { 'uri': uri, 'type': 'git', 'directory': directory }
endfunction"}}}

function! s:type.get_sync_command(plugin) abort "{{{
  let git = g:dein#types#git#command_path
  if !executable(git)
    return 'E: "git" command is not installed.'
  endif

  if !isdirectory(a:plugin.path)
    let cmd = 'clone'
    let cmd .= ' --recursive'

    let depth = get(a:plugin, 'type__depth',
          \ g:dein#types#git#clone_depth)
    if depth > 0 && a:plugin.rev == '' && a:plugin.uri !~ '^git@'
      let cmd .= ' --depth=' . depth
    endif

    let cmd .= printf(' %s "%s"', a:plugin.uri, a:plugin.path)
  else
    let shell = fnamemodify(split(&shell)[0], ':t')
    let and = (!dein#util#_has_vimproc() && shell ==# 'fish') ?
          \ '; and ' : ' && '

    let cmd = g:dein#types#git#pull_command
    let cmd .= and . git . ' submodule update --init --recursive'
  endif

  return git . ' ' . cmd
endfunction"}}}

function! s:type.get_revision_number_command(plugin) abort "{{{
  if !executable(g:dein#types#git#command_path)
    return ''
  endif

  return g:dein#types#git#command_path .' rev-parse HEAD'
endfunction"}}}
function! s:type.get_revision_pretty_command(plugin) abort "{{{
  if !executable(g:dein#types#git#command_path)
    return ''
  endif

  return g:dein#types#git#command_path .
        \ ' log -1 --pretty=format:"%h [%cr] %s"'
endfunction"}}}
function! s:type.get_commit_date_command(plugin) abort "{{{
  if !executable(g:dein#types#git#command_path)
    return ''
  endif

  return g:dein#types#git#command_path .
        \ ' log -1 --pretty=format:"%ct"'
endfunction"}}}
function! s:type.get_log_command(plugin, new_rev, old_rev) abort "{{{
  if !executable(g:dein#types#git#command_path)
        \ || a:new_rev == '' || a:old_rev == ''
    return ''
  endif

  " Note: If the a:old_rev is not the ancestor of two branchs. Then do not use
  " %s^.  use %s^ will show one commit message which already shown last time.
  let is_not_ancestor = dein#install#_system(
        \ g:dein#types#git#command_path . ' merge-base '
        \ . a:old_rev . ' ' . a:new_rev) ==# a:old_rev
  return printf(g:dein#types#git#command_path .
        \ ' log %s%s..%s --graph --pretty=format:"%%h [%%cr] %%s"',
        \ a:old_rev, (is_not_ancestor ? '' : '^'), a:new_rev)

  " Test.
  " return g:dein#types#git#command_path .
  "      \ ' log HEAD^^^^..HEAD --graph --pretty=format:"%h [%cr] %s"'
endfunction"}}}
function! s:type.get_revision_lock_command(plugin) abort "{{{
  if !executable(g:dein#types#git#command_path)
    return ''
  endif

  let rev = a:plugin.rev
  if rev ==# 'release'
    " Use latest released tag
    let rev = get(split(dein#install#_system(g:dein#types#git#command_path
          \ . ' tag --list --sort -version:refname'), "\n"), 0, '')
  endif
  if rev == ''
    " Fix detach HEAD.
    let rev = 'master'
  endif

  return g:dein#types#git#command_path . ' checkout ' . rev
endfunction"}}}
function! s:type.get_rollback_command(plugin, rev) abort "{{{
  if !executable(g:dein#types#git#command_path)
    return ''
  endif

  return g:dein#types#git#command_path . ' reset --hard ' . a:rev
endfunction"}}}

function! s:is_git_dir(path) abort "{{{
  if isdirectory(a:path)
    let git_dir = a:path
  elseif filereadable(a:path)
    " check if this is a gitdir file
    " File starts with "gitdir: " and all text after this string is treated
    " as the path. Any CR or NLs are stripped off the end of the file.
    let buf = join(readfile(a:path, 'b'), "\n")
    let matches = matchlist(buf, '\C^gitdir: \(\_.*[^\r\n]\)[\r\n]*$')
    if empty(matches)
      return 0
    endif
    let path = fnamemodify(a:path, ':h')
    if fnamemodify(a:path, ':t') == ''
      " if there's no tail, the path probably ends in a directory separator
      let path = fnamemodify(path, ':h')
    endif
    let git_dir = dein#util#join_paths(path, matches[1])
    if !isdirectory(git_dir)
      return 0
    endif
  else
    return 0
  endif

  " Git only considers it to be a git dir if a few required files/dirs exist
  " and are accessible inside the directory.
  " Note: we can't actually test file permissions the way we'd like to, since
  " getfperm() gives the mode string but doesn't tell us whether the user or
  " group flags apply to us. Instead, just check if dirname/. is a directory.
  " This should also check if we have search permissions.
  " I'm assuming here that dirname/. works on windows, since I can't test.
  " Note: Git also accepts having the GIT_OBJECT_DIRECTORY env var set instead
  " of using .git/objects, but we don't care about that.
  for name in ['objects', 'refs']
    if !isdirectory(s:join_paths(git_dir, name))
      return 0
    endif
  endfor

  " Git also checks if HEAD is a symlink or a properly-formatted file.
  " We don't really care to actually validate this, so let's just make
  " sure the file exists and is readable.
  " Note: it may also be a symlink, which can point to a path that doesn't
  " necessarily exist yet.
  let head = s:join_paths(git_dir, 'HEAD')
  if !filereadable(head) && getftype(head) != 'link'
    return 0
  endif

  " Sure looks like a git directory. There's a few subtleties where we'll
  " accept a directory that git itself won't, but I think we can safely ignore
  " those edge cases.
  return 1
endfunction "}}}

let s:is_windows = dein#util#_is_windows()

function! s:join_paths(path1, path2) abort "{{{
  " Joins two paths together, handling the case where the second path
  " is an absolute path.
  if s:is_absolute(a:path2)
    return a:path2
  endif
  if a:path1 =~ (s:is_windows ? '[\\/]$' : '/$') ||
        \ a:path2 =~ (s:is_windows ? '^[\\/]' : '^/')
    " the appropriate separator already exists
    return a:path1 . a:path2
  else
    " note: I'm assuming here that '/' is always valid as a directory
    " separator on Windows. I know Windows has paths that start with \\?\ that
    " diasble behavior like that, but I don't know how Vim deals with that.
    return a:path1 . '/' . a:path2
  endif
endfunction "}}}

if s:is_windows
  function! s:is_absolute(path) abort "{{{
    return a:path =~ '^[\\/]\|^\a:'
  endfunction "}}}
else
  function! s:is_absolute(path) abort "{{{
    return a:path =~ '^/'
  endfunction "}}}
endif

" vim: foldmethod=marker
