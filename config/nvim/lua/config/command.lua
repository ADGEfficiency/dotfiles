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
	require("telescope.builtin").find_files(require("telescope.themes").get_ivy({
		prompt_title = "<Personal Notes>",
		search_dirs = { "~/personal", "~/programming-resources" },
		path_display = { "absolute" },
	}))
end
_G.searchPersonalNotes = searchPersonalNotes
-- :S
vim.cmd([[
  command S lua searchPersonalNotes()
]])

-- Fuzzy-find a directory under ~, then find files in it
local function pickDirAndFindFiles()
	local home = vim.fn.expand("~")
	require("telescope.pickers")
		.new(require("telescope.themes").get_ivy({ prompt_title = "<Directories>" }), {
			finder = require("telescope.finders").new_oneshot_job({
				"fd",
				"-H",
				"-a",
				"--type",
				"d",
				"--max-depth",
				"2",
				"--exclude",
				"node_modules",
				"--exclude",
				"venv",
				"--exclude",
				".git",
				".",
				home,
			}, {}),
			sorter = require("telescope.config").values.file_sorter({}),
			attach_mappings = function(prompt_bufnr)
				require("telescope.actions").select_default:replace(function()
					local entry = require("telescope.actions.state").get_selected_entry()
					require("telescope.actions").close(prompt_bufnr)
					require("telescope.builtin").find_files({ cwd = entry.value })
				end)
				return true
			end,
		})
		:find()
end

-- Find files from home, tab-completing or picking the directory
-- :F ~/dot<Tab>  -> complete dir, then find_files there
-- :F             -> fuzzy-pick a directory, then find_files there
vim.api.nvim_create_user_command("F", function(opts)
	if opts.args ~= "" then
		require("telescope.builtin").find_files({ cwd = vim.fn.expand(opts.args) })
	else
		pickDirAndFindFiles()
	end
end, { nargs = "?", complete = "dir" })

-- Abbreviations
vim.cmd("cabbrev v vsp")
vim.cmd("cabbrev s sp")
vim.cmd("cabbrev t Telescope")
vim.cmd("cabbrev f F")

-- Fix typos
vim.cmd("command W write")
vim.cmd("command Q quit")
vim.cmd("command Wq write | quit!")

-- Access Telescope
-- :T
vim.api.nvim_create_user_command("T", "Telescope <args>", { nargs = "+" })
