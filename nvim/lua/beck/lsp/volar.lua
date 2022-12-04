-- Vue Language Server (Volar) configuration

local nvim_lsp = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- local path = nvim_lsp.util.path
-- local volar_path = path.join(vim.fn.stdpath 'data', 'lsp_servers', 'volar', 'node_modules')
-- local globa_ts_server_path = path.join(volar_path, 'typescript', 'lib')
print(nvim_lsp.util.available_servers())
nvim_lsp.volar.setup{
  capabilities = capabilities,
  filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'},
  --  init_options = {
  --    typescript = {
  --      tsdk = globa_ts_server_path,
  --    }
  --  },
  settings = {
    volar = { autoCompleteRefs = true },
  },
}

