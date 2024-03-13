-- Command Mode

-- Close quickfix with q
vim.cmd([[
  autocmd FileType qf nnoremap <buffer> q :close<CR>
]])

-- Search for tags and open in quickfix
-- :Tags leadership
vim.cmd([[
  command! -nargs=1 Tags execute 'grep -R "\- ' . <q-args> . '" . > /tmp/greptags.txt' | execute 'cfile /tmp/greptags.txt' | copen
]])

-- Open todo file
-- :Todo
vim.cmd([[
  command Todo :sp ~/personal/para/todo.md
]])

-- Open to/get file
-- :Get
vim.cmd([[
  command Get :sp ~/personal/para/area/to/get.md
]])

-- Abbreviations
vim.cmd("cabbrev v vsp")
vim.cmd("cabbrev s sp")
vim.cmd("cabbrev f Telescope find_files cwd=")
vim.cmd("cabbrev t Telescope")

-- Fix typos
vim.cmd("command W write")
vim.cmd("command Q quit")
vim.cmd("command Wq write | quit!")

-- Access Telescope as :T
vim.api.nvim_create_user_command("T", "Telescope <args>", { nargs = "+" })
