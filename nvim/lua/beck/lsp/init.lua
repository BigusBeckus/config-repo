-- Mappings. (Copied from the nvim-lspconfig docs)
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)

  -- tsserver - denols conflict resolution
  local active_clients = vim.lsp.get_active_clients()
  if client.name == 'denols' then
    for _, client_ in pairs(active_clients) do
      -- Stop tsserver if denols is already active
      if client_.name == 'tsserver' then
        client_.stop()
      end
    end
  elseif client.name == 'tsserver' then
    for _, client_ in pairs(active_clients) do
      -- Prevent tsserver from running if denols is already active
      if client_.name == 'denols' then
        client.stop()
      end
    end
  end
end

-- Custom config
local nvim_lsp = require('lspconfig')

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Allows searching for patterns in parent folders (used for tsserver and denols)
local root_pattern = nvim_lsp.util.root_pattern

nvim_lsp.astro.setup{
  capabilities = capabilities,
  on_attach = on_attach,
}
nvim_lsp.sumneko_lua.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}
nvim_lsp.dartls.setup{
  capabilities = capabilities,
  on_attach = on_attach,
}
nvim_lsp.rust_analyzer.setup{
  capabilities = capabilities,
  on_attach = on_attach,
}
nvim_lsp.vimls.setup{
  capabilities = capabilities,
  on_attach = on_attach,
}
vim.g.markdown_fenced_languages = {
  "ts=typescript"
}
nvim_lsp.tsserver.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  -- root_dir = root_pattern("package.json"),
}
nvim_lsp.denols.setup{
  capabilities = capabilities,
  on_attach = on_attach,
  root_dir = root_pattern("deno.json", "deno.jsonc"),
}
-- require('beck.lsp.volar')

