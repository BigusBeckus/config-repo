local builtin = require("telescope.builtin")

vim.keymap.set("n", "<C-p>", function()
	builtin.find_files({
		hidden = true,
	})
end, { noremap = true })

vim.keymap.set("n", "<leader>pf", builtin.live_grep, { noremap = true })
vim.keymap.set("n", "<leader>pg", builtin.git_files, { noremap = true })

-- vim.keymap.set("n", "<leader>pf", builtin.grep_string, { noremap = true })
-- vim.keymap.set("n", "<leader>ps", function()
-- 	builtin.grep_string({ search = vim.fn.input("Grep > ") })
-- end)
