local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
  return
end

-- require("luasnip/loaders/from_vscode").lazy_load()
require("luasnip/loaders/from_snipmate").load({ paths = "./snippets" })

-- for supertab functionality
local check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

--   פּ ﯟ   some other good icons - more here: https://www.nerdfonts.com/cheat-sheet
local kind_icons = {
  Text = "",
  Method = "m",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
}

for _, cmd_type in ipairs({ ':', '/', '?', '@' }) do
  cmp.setup.cmdline(cmd_type, {
    sources = cmp.config.sources({
      {name = 'cmdline'},
      {name = 'cmdline_history'},
      {name = 'path'},
      {name = 'buffer'},
    }),
  })
end

require("cmp_dictionary").setup({
  dic = {
    ["*"] = { "/usr/share/dict/words" },
    ["python"] = {"~/dotfiles/dict/python.dic"},
  },
  exact = -1,
  first_case_insensitive = true,
  document = false,
  document_command = "wn %s -over",
  async = true,
  capacity = 5,
  debug = true,
  max_items = 3
})

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
    ["<C-p>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      else
        cmp.complete()
      end
    end, { 'i', 'c' }),
    ["<C-n>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_next_item()
      else
        cmp.complete()
      end
    end, { 'i', 'c' }),
    ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ["<C-e>"] = cmp.mapping {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    },
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ["<CR>"] = cmp.mapping.confirm { select = false },
    -- supertab functionality
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expandable() then
        luasnip.expand()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif check_backspace() then
        fallback()
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      -- Kind icons
      vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
      -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
      vim_item.menu = ({
        nvim_lsp = "[LSP]",
        luasnip = "[Snippet]",
        path = "[Path]",
        buffer = "[Buffer]",
        dictionary = "[Dict]",
      })[entry.source.name]
      return vim_item
    end,
  },
  sources = {
    { name = "luasnip" },
    { name = "nvim_lsp" },
    { name = "path", option = {get_cwd = function(params) return vim.fn.getcwd() end} },
    { name = "buffer", option = {get_bufnrs = function() return vim.api.nvim_list_bufs() end}},
    { name = "emoji" },
    { name = "latex_symbols" },
    { name = "npm", keyword_length = 4 },
    { name = "dictionary", keyword_length = 3, max_item_count = 3 },
  },
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
  experimental = {
    ghost_text = true,
    native_menu = false,
  },
  window = {
    documentation = {
      border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    },
  }
}

cmp.setup.filetype('python', {
  sources = {
    {name = "luasnip" },
    {name = "buffer", option = {get_bufnrs = function() return vim.api.nvim_list_bufs() end}},
    {name = "path", option = {get_cwd = function(params) return vim.fn.getcwd() end}},
    {name = "nvim_lsp"},
    {name = "dictionary", keyword_length = 4, max_item_count = 3 },
  },
})

cmp.setup.filetype('markdown', {
  sources = {
    {name = "buffer", option = {get_bufnrs = function() return vim.api.nvim_list_bufs() end}},
    {name = "path", option = {get_cwd = function(params) return vim.fn.getcwd() end}},
    {name = "buffer-lines", option = {words = true, comments = true}},
    {name = "dictionary", keyword_length = 4, max_item_count = 3},
    {name = "luasnip"},
  },
})
