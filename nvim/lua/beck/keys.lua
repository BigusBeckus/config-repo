-- Termcode escape function
-- local function t(str)
--   return vim.api.nvim_replace_termcodes(str, true, true, true)
-- end

vim.keymap.set('', '<C-p>', require'telescope.builtin'.find_files, { noremap = true })

