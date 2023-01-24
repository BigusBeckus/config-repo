local lsp = require("lsp-zero")
-- local mason = require("mason")

lsp.set_preferences({
	suggest_lsp_servers = true,
	setup_servers_on_start = true,
	set_lsp_keymaps = true,
	configure_diagnostics = true,
	cmp_capabilities = true,
	manage_nvim_cmp = true,
	call_servers = "local",

	-- Alternative sign icons A
	-- 	sign_icons = {
	-- 		error = "x",
	-- 		warn = "!",
	-- 		hint = "?",
	-- 		info = "i",
	-- 	},
	-- })

	-- Alternative sign icons B
	-- sign_icons = {
	-- 	error = "E",
	-- 	warn = "W",
	-- 	hint = "H",
	-- 	info = "I",
	-- },
})

lsp.nvim_workspace({
	library = vim.api.nvim_get_runtime_file("", true),
})

lsp.ensure_installed({
	"astro",
	"cssls",
	"denols",
	"dockerls",
	-- "eslint",
	--_ "eslint_d",
	"gopls",
	"graphql",
	"html",
	-- "prettierd",
	"rust_analyzer",
	"sumneko_lua",
	"svelte",
	"vimls",
	"volar",
	"tsserver",
})

-- vim.api.nvim_command([[MasonInstall eslint_d]])
-- vim.api.nvim_command([[MasonInstall prettierd]])

-- Custom LSP configs
local root_pattern = require("lspconfig").util.root_pattern

-- lsp.use({ "eslint_d" }, {
-- 	root_dir = root_pattern(
-- 		".eslintrc",
-- 		".eslintrc.js",
-- 		".eslintrc.json",
-- 		".eslintrc.cjs",
-- 		".eslintrc.yml",
-- 		".eslintrc.yaml"
-- 	),
-- })

lsp.use({ "eslint" }, {
	root_dir = root_pattern(
		".eslintrc",
		".eslintrc.js",
		".eslintrc.json",
		".eslintrc.cjs",
		".eslintrc.yml",
		".eslintrc.yaml"
	),
})

lsp.configure("jsonls", {
	filetypes = { "sqq", "json", "jsonc" },
	settings = {
		json = {
			-- Schemas https://www.schemastore.org
			schemas = {
				{
					fileMatch = { "package.json" },
					url = "https://json.schemastore.org/package.json",
				},
				{
					fileMatch = { "tsconfig.json", "tsconfig.*.json" },
					url = "https://json.schemastore.org/tsconfig.json",
				},
				{
					fileMatch = {
						".prettierrc",
						".prettierrc.json",
						"prettier.config.json",
					},
					url = "https://json.schemastore.org/prettierrc.json",
				},
				{
					fileMatch = { ".eslintrc", ".eslintrc.json" },
					url = "https://json.schemastore.org/eslintrc.json",
				},
				{
					fileMatch = { ".babelrc", ".babelrc.json", "babel.config.json" },
					url = "https://json.schemastore.org/babelrc.json",
				},
				{
					fileMatch = { "lerna.json" },
					url = "https://json.schemastore.org/lerna.json",
				},
				{
					fileMatch = { "now.json", "vercel.json" },
					url = "https://json.schemastore.org/now.json",
				},
				{
					fileMatch = {
						".stylelintrc",
						".stylelintrc.json",
						"stylelint.config.json",
					},
					url = "http://json.schemastore.org/stylelintrc.json",
				},
			},
		},
	},
})

-- Set deno-ls root pattern to fix conflicts with tsserver
lsp.configure("denols", {
	root_dir = root_pattern("deno.json", "deno.jsonc"),
})

-- Setup lua language server
-- lsp.configure("sumneko_lua", {
-- 	settings = {
-- 		Lua = {
-- 			runtime = {
-- 				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
-- 				version = "LuaJIT",
-- 			},
-- 			diagnostics = {
-- 				-- Get the language server to recognize the `vim` global
-- 				globals = { "vim" },
-- 			},
-- 			workspace = {
-- 				-- Make the server aware of Neovim runtime files
-- 				library = vim.api.nvim_get_runtime_file("", true),
-- 			},
-- 			-- Do not send telemetry data containing a randomized but unique identifier
-- 			telemetry = {
-- 				enable = false,
-- 			},
-- 		},
-- 	},
-- })

-- nvim-cmp configuration
local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
	["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
	["<C-b>"] = cmp.mapping.scroll_docs(-4),
	["<C-f>"] = cmp.mapping.scroll_docs(4),
	["<C-Space>"] = cmp.mapping.complete(),
	["<C-e>"] = cmp.mapping.abort(),
	["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
})

lsp.setup_nvim_cmp({
	mappings = cmp_mappings,
})

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
	vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
	vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)
	vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)

	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
	vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)

	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
	vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
	vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
	vim.keymap.set("n", "<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, opts)

	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

	-- tsserver - denols conflict resolution
	local active_clients = vim.lsp.get_active_clients()
	if client.name == "denols" then
		for _, client_ in pairs(active_clients) do
			-- Stop tsserver if denols is already active
			if client_.name == "tsserver" then
				client_.stop()
			end
		end
	elseif client.name == "tsserver" then
		for _, client_ in pairs(active_clients) do
			-- Prevent tsserver from running if denols is already active
			if client_.name == "denols" then
				client.stop()
			end
		end
	end
end)

-- Setup lsp-zero
lsp.setup()

-- Diagnostics
vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	update_in_insert = false,
	underline = true,
	severity_sort = true,
	float = true,
})

-- lsp-zero default
-- {
--   virtual_text = false,
--   signs = true,
--   update_in_insert = false,
--   underline = true,
--   severity_sort = true,
--   float = {
--     focusable = false,
--     style = 'minimal',
--     border = 'rounded',
--     source = 'always',
--     header = '',
--     prefix = '',
--   },
-- }

-- vim default
-- {
-- 	virtual_text = true,
-- 	signs = true,
-- 	update_in_insert = false,
-- 	underline = true,
-- 	severity_sort = false,
-- 	float = true,
-- }