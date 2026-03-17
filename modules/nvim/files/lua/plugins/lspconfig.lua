return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      {
        "antosha417/nvim-lsp-file-operations",
        config = true,
      },
      "hrsh7th/cmp-nvim-lsp",
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
      "mfussenegger/nvim-dap",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            "luvit-meta/library", -- see below
            plugins = {
              { "nvim-dap-ui" },
              types = true,
            },
          },
        },
      },
      {
        "Bilal2453/luvit-meta",
        lazy = true,
      }, -- optional `vim.uv` typings
    },
    opts = {
      inlay_hints = { enabled = false },
    },
    config = function()
      local keymap = vim.keymap -- for conciseness

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          -- Buffer local mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
          local opts = { buffer = ev.buf, silent = true }

          -- set keybinds
          opts.desc = "Go to reference"
          keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

          opts.desc = "Go to declaration"
          keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

          opts.desc = "Show LSP definitions"
          keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

          opts.desc = "Show LSP implementations"
          keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

          opts.desc = "Show LSP type definitions"
          keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

          opts.desc = "See available code actions"
          keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

          opts.desc = "Smart rename"
          keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

          opts.desc = "Show documentation for what is under cursor"
          keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

          opts.desc = "Restart LSP"
          keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary

          opts.desc = "Show signature help"
          keymap.set({ "n", "i" }, "<C-k>", vim.lsp.buf.signature_help, opts) -- show signature help

          opts.desc = "Show document symbols"
          keymap.set("n", "<leader>ds", "<cmd>Telescope lsp_document_symbols<CR>", opts) -- show document symbols

          opts.desc = "Show workspace symbols"
          keymap.set("n", "<leader>ws", "<cmd>Telescope lsp_workspace_symbols<CR>", opts) -- show workspace symbols

          opts.desc = "Workspace add folder"
          keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts) -- workspace add folder

          opts.desc = "Workspace remove folder"
          keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts) -- workspace remove folder

          opts.desc = "Workspace list folders"
          keymap.set("n", "<leader>wl", function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, opts) -- workspace list folders
        end,
      })

      -- Setup Handlers
      vim.lsp.handlers["textDocument/hover"] =
        vim.lsp.with(vim.lsp.handlers.hover, { float = { border = "rounded" }, virtual_text = false })
      vim.lsp.handlers["textDocument/diagnostic"] =
        vim.lsp.with(vim.lsp.diagnostic.on_diagnostic, { float = { border = "rounded" }, virtual_text = false })
      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
        vim.lsp.handlers.signature_help,
        { float = { border = "rounded" }, source = true, virtual_text = false }
      )
      -- LSP integration
      -- Make sure to also have the snippet with the common helper functions in your config!

      -- local client_notifs = {}
      --
      -- local function get_notif_data(client_id, token)
      --   if not client_notifs[client_id] then
      --     client_notifs[client_id] = {}
      --   end
      --
      --   if not client_notifs[client_id][token] then
      --     client_notifs[client_id][token] = {}
      --   end
      --
      --   return client_notifs[client_id][token]
      -- end
      --
      -- local function format_title(title, client_name)
      --   return client_name .. (#title > 0 and ": " .. title or "")
      -- end
      --
      -- local function format_message(message, percentage)
      --   return (percentage and percentage .. "%\t" or "") .. (message or "")
      -- end
      --
      -- local spinner_frames = { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" }
      --
      -- local function update_spinner(c_id, token)
      --   local notif_data = get_notif_data(c_id, token)
      --
      --   if notif_data.spinner then
      --     local new_spinner = (notif_data.spinner + 1) % #spinner_frames
      --     notif_data.spinner = new_spinner
      --
      --     ---@diagnostic disable-next-line: lua_ls
      --     notif_data.notification = vim.notify(nil, nil, {
      --       hide_from_history = true,
      --       icon = spinner_frames[new_spinner],
      --       replace = notif_data.notification,
      --     })
      --
      --     vim.defer_fn(function()
      --       update_spinner(c_id, token)
      --     end, 100)
      --   end
      -- end
      --
      -- vim.lsp.handlers["$/progress"] = function(_, result, ctx)
      --   local client_id = ctx.client_id
      --
      --   local val = result.value
      --
      --   if not val.kind then
      --     return
      --   end
      --
      --   -- Utility functions shared between progress reports for LSP and DAP
      --
      --   local notif_data = get_notif_data(client_id, result.token)
      --
      --   if val.kind == "begin" then
      --     local message = format_message(val.message, val.percentage)
      --
      --     notif_data.notification = vim.notify(message, "info", {
      --       -- title = format_title(val.title, vim.lsp.get_client_by_id(client_id).name),
      --       icon = spinner_frames[1],
      --       timeout = false,
      --       hide_from_history = false,
      --     })
      --
      --     notif_data.spinner = 1
      --     update_spinner(client_id, result.token)
      --   elseif val.kind == "report" and notif_data then
      --     notif_data.notification = vim.notify(format_message(val.message, val.percentage), "info", {
      --       -- title = val.title,
      --       replace = notif_data.notification,
      --       hide_from_history = false,
      --       timeout = 2000,
      --     })
      --   elseif val.kind == "end" and notif_data then
      --     notif_data.notification =
      --       vim.notify(val.message and format_message(val.message) or "LSP setup complete!", "info", {
      --         icon = "",
      --         replace = notif_data.notification,
      --         timeout = 3000,
      --       })
      --
      --     notif_data.spinner = nil
      --   end
      -- end
      --
      -- Setup Diagnostics
      vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        float = { border = "rounded", source = true },
        source = true,
        underline = false,
        virtual_text = false,
      })
      vim.lsp.handlers["workspace/diagnostic/refresh"] = function(_, _, ctx)
        local ns = vim.lsp.diagnostic.get_namespace(ctx.client_id)
        local bufnr = vim.api.nvim_get_current_buf()
        vim.diagnostic.reset(ns, bufnr)
        return true
      end

      -- DAP integration
      -- Make sure to also have the snippet with the common helper functions in your config!
      -- local dap = require("dap")
      --
      -- dap.listeners.before["event_progressStart"]["progress-notifications"] = function(session, body)
      --   local notif_data = get_notif_data("dap", body.progressId)
      --
      --   local message = format_message(body.message, body.percentage)
      --   notif_data.notification = vim.notify(message, "info", {
      --     title = format_title(body.title, session.config.type),
      --     icon = spinner_frames[1],
      --     timeout = false,
      --     hide_from_history = false,
      --   })
      --
      --   notif_data.notification.spinner = 1, update_spinner("dap", body.progressId)
      -- end
      --
      -- dap.listeners.before["event_progressUpdate"]["progress-notifications"] = function(session, body)
      --   local notif_data = get_notif_data("dap", body.progressId)
      --   notif_data.notification = vim.notify(format_message(body.message, body.percentage), "info", {
      --     replace = notif_data.notification,
      --     hide_from_history = false,
      --   })
      -- end
      --
      -- dap.listeners.before["event_progressEnd"]["progress-notifications"] = function(session, body)
      --   local notif_data = client_notifs["dap"][body.progressId]
      --   notif_data.notification = vim.notify(body.message and format_message(body.message) or "Complete", "info", {
      --     icon = "",
      --     replace = notif_data.notification,
      --     timeout = 3000,
      --   })
      --   notif_data.spinner = nil
      -- end

      vim.lsp.inlay_hint.enable(false)

      -- Change the Diagnostic symbols in the sign column (gutter)
      local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      require("cmp_nvim_lsp").default_capabilities(capabilities)

      -- [[ Setup Mason ]]
      local mason = require("mason")

      mason.setup({
        ensure_installed = {
          -- Golang
          "goimmports",
          "gofumpt",
          -- Python
          "black",
          "ruff",
          "isort",
          "python-lsp-server",
          -- JavaScript
          "eslint",
          "prettier",
          -- Lua
          "stylua",
        },
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })

      -- [[ LSP Settings ]]
      local mason_lspconfig = require("mason-lspconfig")

      -- Language Servers
      local servers = {
        -- angularls = {},
        -- arduino_language_server = {},
        awk_ls = {},
        bashls = {},
        -- biome = {},
        -- clangd = {},
        -- cmake = {},
        css_variables = {},
        cssls = {},
        cssmodules_ls = {},
        diagnosticls = {},
        docker_compose_language_service = {},
        -- dockerls = {
        --   settings = {
        --     docker = {
        --       languageserver = {
        --         formatter = {
        --           enable = false,
        --           ignoreMultilineInstructions = true,
        --         },
        --       },
        --     },
        --   },
        -- },
        elixirls = {},
        -- emmet_ls = {},
        erlangls = {},
        -- eslint = {},
        gh_actions_ls = {
          init_options = {},
        },
        golangci_lint_ls = {},
        gopls = {},
        graphql = {},
        html = {},
        -- htmx = {},
        -- jinja_lsp = {},
        jqls = {},
        jsonls = {},
        lua_ls = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            completion = {
              callSnippet = "Replace",
            },
            runtime = {
              version = "LuaJIT",
              path = vim.split(package.path, ";"),
            },
            telemetry = { enable = false },
            workspace = {
              checkThirdParty = false,
              library = {
                vim.env.VIMRUNTIME,
                "~/.local/share/nvim/lazy/dracula.nvim",
              },
            },
          },
        },
        -- markdown_oxide = {},
        marksman = {},
        -- powershell_es = {},
        -- prismals = {},
        pylsp = {
          pylsp = {
            plugins = {
              pycodestyle = {
                ignore = { "E501", "E711", "E741", "W503" },
              },
            },
          },
        },
        pyright = {
          analysis = {
            autoImport = true,
          },
        },
        rubocop = {},
        ruff = {},
        solargraph = {},
        sqlls = {},
        tailwindcss = {},
        terraformls = {},
        tflint = {},
        vimls = {},
        yamlls = {},
      }

      mason_lspconfig.setup({
        automatic_enable = true,
        ensure_installed = vim.tbl_keys(servers),
      })

      -- [[ Mason Tool Installer ]]
      local mason_tool_installer = require("mason-tool-installer")

      local ensure_installed = {
        { "bash-language-server", auto_update = true },
        { "black", auto_update = true },
        { "editorconfig-checker", auto_update = true },
        -- { "eslint_d", auto_update = false, version = "13.1.2" },
        { "gofumpt", auto_update = true },
        { "golangci-lint", auto_update = true },
        { "golines", auto_update = true },
        { "gomodifytags", auto_update = true },
        { "gopls", auto_update = true },
        { "gotests", auto_update = true },
        { "impl", auto_update = true },
        { "isort", auto_update = true },
        { "json-to-struct", auto_update = true },
        { "lua-language-server", auto_update = true },
        { "luacheck", auto_update = true },
        { "misspell", auto_update = true },
        { "mypy", auto_update = true },
        { "prettier", auto_update = true },
        { "pylint", auto_update = true },
        { "python-lsp-server", auto_update = true },
        { "revive", auto_update = true },
        { "ruff", auto_update = true },
        { "shellcheck", auto_update = true },
        { "shfmt", auto_update = true },
        { "staticcheck", auto_update = true },
        -- { "stylua",                     auto_update = true },
        { "tree-sitter-cli", auto_update = true },
        { "typescript-language-server", auto_update = true },
        { "vim-language-server", auto_update = true },
        { "yamlls", auto_update = true },
        { "vint", auto_update = true },
      }

      local darwin_install = {
        { "ansible-lint", auto_update = true },
        -- { "biome",            auto_update = true },
        { "js-debug-adapter", auto_update = true },
        { "markmap-cli", auto_update = true },
        { "semgrep", auto_update = true },
        { "sqlfluff", auto_update = true },
      }

      local os = vim.loop.os_uname().sysname
      if os == "Darwin" then
        for _, tool in ipairs(darwin_install) do
          table.insert(ensure_installed, tool)
        end
      end

      mason_tool_installer.setup({
        ensure_installed = ensure_installed,
        lazy = true,
      })

      -- Apply diagnostic config after all handlers are set
      vim.diagnostic.config({
        float = {
          border = "rounded",
          source = true,
          winhighlight = "Normal:Pmenu,FloatBorder:CmpCmdlineBorder",
        },
        severity_sort = true,
        underline = false,
        update_in_insert = false,
        virtual_text = false,
      })
    end,
  },
  { "stevanmilic/nvim-lspimport" },
}
