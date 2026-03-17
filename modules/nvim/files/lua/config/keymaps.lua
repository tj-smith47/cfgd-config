-- [[ Keymaps for a better default experience ]]
-- local nmap = function(keys, func, desc)
--   if desc then
--     desc = "LSP: " .. desc
--   end
--   vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
-- end

local opts = { silent = true, noremap = true }
local keymap = vim.keymap.set

-- If I visually select words and paste from clipboard, don't replace my
-- clipboard with the selected word, instead keep my old word in the
-- clipboard
keymap("v", "p", '"_dP', opts)

keymap({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Diagnostic keymaps
keymap("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
keymap("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
keymap("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show line diagnostics" })
keymap("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", { desc = "Show buffer diagnostics" })
-- keymap("n", "<leader>q", vim.diagnostic.setloclist)

-- Dismiss Notifications
vim.api.nvim_set_keymap("n", "<Esc><Esc>", ":lua require('notify').dismiss()<CR>", {})

-- Executor keymaps
-- vim.api.nvim_set_keymap("n", "<leader>er", ":ExecutorRun<CR>", {})
-- vim.api.nvim_set_keymap("n", "<leader>ex", ":ExecutorSetCommand", {})
-- vim.api.nvim_set_keymap("n", "<leader>ev", ":ExecutorToggleDetail<CR>", {})

-- Format keymaps
keymap({ "n", "v" }, "<leader>mp", function()
  require("conform").format({
    lsp_format = "fallback",
    timeout_ms = 1000,
  })
end, { desc = "Format file or range (in visual mode)" })

-- Git Blame
keymap("n", "gb", ":GitBlameLineToggle<CR>", { desc = "[G]it [B]lame Toggle" })

-- Nvim Tree keymaps
keymap("n", "<leader>t", require("nvim-tree.api").tree.toggle, { desc = "Nvim [T]ree Toggle" })

-- Open URL (custom)
keymap({ "n", "v" }, "gx", "<esc>:URLOpenUnderCursor<cr>")

-- Remap for dealing with word wrap
keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Telescope keymaps
keymap("n", "<leader>?", require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" })
keymap("n", "<leader><space>", require("telescope.builtin").buffers, { desc = "[ ] Find existing buffers" })
keymap("n", "<leader>/", function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
    winblend = 10,
    previewer = false,
    theme = "dracula",
  }))
end, { desc = "[/] Fuzzily search in current buffer]" })

keymap("n", "<leader>sf", require("telescope.builtin").find_files, { desc = "[S]earch [F]iles" })
keymap("n", "<leader>gf", require("telescope.builtin").git_files, { desc = "Search [G]it [F]iles" })
keymap("n", "<leader>sh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
keymap("n", "<leader>sw", require("telescope.builtin").grep_string, { desc = "[S]earch current [W]ord" })
keymap("n", "<leader>sg", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })
keymap("n", "<leader>sd", require("telescope.builtin").diagnostics, { desc = "[S]earch [D]iagnostics" })

-- SOPS Keymaps
keymap("n", "<leader>ef", vim.cmd.SopsEncrypt, { desc = "[E]ncrypt [F]ile" })
keymap("n", "<leader>df", vim.cmd.SopsDecrypt, { desc = "[D]ecrypt [F]ile" })
