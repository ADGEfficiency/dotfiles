require("copilot").setup({
  panel = {enabled = false},
  suggestion = {enabled = false},
  filetypes = {
    python = true,
    markdown = true,
    yaml = true,
    help = false,
    gitcommit = false,
    gitrebase = false,
    hgcommit = false,
    svn = false,
    cvs = false,
    ["*"] = true,
  },
  copilot_node_command = "$HOME/dotfiles/nvm/versions/node/v16.17.0/bin/node"
  server_opts_overrides = {},
})
