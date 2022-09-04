local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
  "        `       --._    `-._   `-.   `.     :   /  .'   .-'   _.-'    _.--'                 ",
  "        `--.__     `--._   `-._  `-.  `. `. : .' .'  .-'  _.-'   _.--'     __.--'           ",
  "           __    `--.__    `--._  `-._ `-. `. :/ .' .-' _.-'  _.--'    __.--'    __         ",
  "            `--..__   `--.__   `--._ `-._`-.`_=_'.-'_.-' _.--'   __.--'   __..--'           ",
  "          --..__   `--..__  `--.__  `--._`-q(-_-)p-'_.--'  __.--'  __..--'   __..--         ",
  "                ``--..__  `--..__ `--.__ `-'_) (_`-' __.--' __..--'  __..--''               ",
  "          ...___        ``--..__ `--..__`--/__/  --'__..--' __..--''        ___...          ",
  "                ```---...___    ``--..__`_(<_   _/)_'__..--''    ___...---'''               ",
  "           ```-----....._____```---...___(____|_/__)___...---'''_____.....-----'''          ",
  "    ",
  "Virtue is what you do when nobody is looking. The rest is marketing. - Nassim Nicholas Taleb",
}

dashboard.section.buttons.val = {
  dashboard.button("r", "  recent", ":Telescope oldfiles<CR>"),
  dashboard.button("e", "  neu", ":ene <BAR> startinsert <CR>"),
  dashboard.button("f", "  find local", ":Telescope find_files cwd=.<CR>"),
  dashboard.button("g", "  find global", ":Telescope find_files cwd=~<CR>"),
  dashboard.button(
    "p",
    "  find personal",
    ":Telescope find_files search_dirs=['~/personal','~/programming-resources']<CR>"
  ),
  dashboard.button("q", "  quit", ":qa<CR>"),
}

dashboard.section.footer.val = {
  "The true test of a man’s character is what he does when no one is watching. - John Wooden",
}

alpha.setup(dashboard.opts)

vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
