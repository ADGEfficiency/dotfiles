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

-- Open todo.md
-- :Todo
vim.cmd([[
  command Todo :sp $PERSONAL_PATH/todo.md
]])

-- Open to/get.md
-- :Get
vim.cmd([[
  command Get :sp $PERSONAL_PATH/area/to/get.md
]])

-- Search in personal notes
local function searchPersonalNotes()
	require("telescope.builtin").find_files({
		prompt_title = "<Personal Notes>",
		search_dirs = { "~/personal", "~/programming-resources" },
		path_display = { "absolute" },
	})
end
_G.searchPersonalNotes = searchPersonalNotes
-- :S
vim.cmd([[
  command S lua searchPersonalNotes()
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

-- Access Telescope
-- :T
vim.api.nvim_create_user_command("T", "Telescope <args>", { nargs = "+" })
