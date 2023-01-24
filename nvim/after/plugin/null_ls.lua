local null_ls = require("null-ls")
null_ls.setup({
	sources = {
		-- Formatters
		null_ls.builtins.formatting.buf,
		null_ls.builtins.formatting.cbfmt,
		null_ls.builtins.formatting.dart_format,
		null_ls.builtins.formatting.deno_fmt,
		null_ls.builtins.formatting.markdownlint,
		-- null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.eslint_d,
		null_ls.builtins.formatting.prettierd,
		null_ls.builtins.formatting.shfmt,
		null_ls.builtins.formatting.sql_formatter,
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.yamlfmt,
		-- null_ls.builtins.diagnostics.sqlfluff.with({
		-- 	extra_args = { "--dialect", "postgres" },
		-- }),

		-- Linters
		null_ls.builtins.diagnostics.eslint_d,
		-- null_ls.builtins.diagnostics.eslint,

		-- Code actions
		null_ls.builtins.code_actions.eslint_d,
		-- null_ls.builtins.code_actions.eslint,
	},
})
