return {
  -- Inspiration from: https://github.com/goolord/alpha-nvim/discussions/16
  "goolord/alpha-nvim",
  event = "VimEnter",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local alpha = require("alpha")
    require("alpha.term")

    -- [[ Configuration ]]
    local dash_theme = "standard"
    local header_type = "slanted"
    local menu_type = "extended"
    local user = "TJ Smith"

    local function make_greeter(row)
      local row_width = vim.fn.strdisplaywidth(row)
      local greeter = "Welcome, " .. user .. "!"
      return string.rep(" ", (row_width - vim.fn.strdisplaywidth(greeter)) / 2) .. greeter
    end

    -- [[ Themes ]]
    local function set_theme(type)
      if type == "standard" then
        return require("alpha.themes.dashboard")
      elseif type == "startify" then
        return require("alpha.themes.startify")
      elseif type == "theta" then
        return require("alpha.themes.theta")
      end
    end

    -- [[ Headers ]]
    local function set_header_simple(dash)
      local row1 = [[                  ]]
      local greeter = make_greeter(row1)
      dash.section.header.val = {
        row1,
        [[ ███       ███ ]],
        [[████      ████]],
        [[██████     █████]],
        [[███████    █████]],
        [[████████   █████]],
        [[█████████  █████]],
        [[█████ ████ █████]],
        [[█████  █████████]],
        [[█████   ████████]],
        [[█████    ███████]],
        [[█████     ██████]],
        [[████      ████]],
        [[ ███       ███ ]],
        [[                  ]],
        [[ N  E  O  V  I  M ]],
        greeter,
      }

      dash.section.header.opts.hl = {
        {
          { "AlphaNeovimLogoBlue", 0, 0 },
          { "AlphaNeovimLogoGreen", 1, 14 },
          { "AlphaNeovimLogoBlue", 23, 34 },
        },
        {
          { "AlphaNeovimLogoBlue", 0, 2 },
          { "AlphaNeovimLogoGreenFBlueB", 2, 4 },
          { "AlphaNeovimLogoGreen", 4, 19 },
          { "AlphaNeovimLogoBlue", 27, 40 },
        },
        {
          { "AlphaNeovimLogoBlue", 0, 4 },
          { "AlphaNeovimLogoGreenFBlueB", 4, 7 },
          { "AlphaNeovimLogoGreen", 7, 22 },
          { "AlphaNeovimLogoBlue", 29, 42 },
        },
        {
          { "AlphaNeovimLogoBlue", 0, 8 },
          { "AlphaNeovimLogoGreenFBlueB", 8, 10 },
          { "AlphaNeovimLogoGreen", 10, 25 },
          { "AlphaNeovimLogoBlue", 31, 44 },
        },
        {
          { "AlphaNeovimLogoBlue", 0, 10 },
          { "AlphaNeovimLogoGreenFBlueB", 10, 13 },
          { "AlphaNeovimLogoGreen", 13, 28 },
          { "AlphaNeovimLogoBlue", 33, 46 },
        },
        {
          { "AlphaNeovimLogoBlue", 0, 13 },
          { "AlphaNeovimLogoGreen", 14, 31 },
          { "AlphaNeovimLogoBlue", 35, 49 },
        },
        {
          { "AlphaNeovimLogoBlue", 0, 13 },
          { "AlphaNeovimLogoGreen", 16, 32 },
          { "AlphaNeovimLogoBlue", 35, 49 },
        },
        {
          { "AlphaNeovimLogoBlue", 0, 13 },
          { "AlphaNeovimLogoGreen", 17, 33 },
          { "AlphaNeovimLogoBlue", 35, 49 },
        },
        {
          { "AlphaNeovimLogoBlue", 0, 13 },
          { "AlphaNeovimLogoGreen", 18, 34 },
          { "AlphaNeovimLogoGreenFBlueB", 33, 35 },
          { "AlphaNeovimLogoBlue", 35, 49 },
        },
        {
          { "AlphaNeovimLogoBlue", 0, 13 },
          { "AlphaNeovimLogoGreen", 19, 35 },
          { "AlphaNeovimLogoGreenFBlueB", 34, 35 },
          { "AlphaNeovimLogoBlue", 35, 49 },
        },
        {
          { "AlphaNeovimLogoBlue", 0, 13 },
          { "AlphaNeovimLogoGreen", 20, 36 },
          { "AlphaNeovimLogoGreenFBlueB", 35, 37 },
          { "AlphaNeovimLogoBlue", 37, 49 },
        },
        {
          { "AlphaNeovimLogoBlue", 0, 13 },
          { "AlphaNeovimLogoGreen", 21, 37 },
          { "AlphaNeovimLogoGreenFBlueB", 36, 37 },
          { "AlphaNeovimLogoBlue", 37, 49 },
        },
        {
          { "AlphaNeovimLogoBlue", 1, 13 },
          { "AlphaNeovimLogoGreen", 20, 35 },
          { "AlphaNeovimLogoBlue", 37, 48 },
        },
        {},
        { { "AlphaNeovimLogoGreen", 0, 9 }, { "AlphaNeovimLogoBlue", 9, 18 } },
      }
    end

    local function set_header_slanted(dash)
      local row1 = [[                                                                       ]]
      local greeter = make_greeter(row1)
      dash.section.header.val = {
        row1,
        [[                                                                       ]],
        [[                                                                       ]],
        [[                                                                     ]],
        [[       ████ ██████           █████      ██                     ]],
        [[      ███████████             █████                             ]],
        [[      █████████ ███████████████████ ███   ███████████   ]],
        [[     █████████  ███    █████████████ █████ ██████████████   ]],
        [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
        [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
        [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
        [[                                                                       ]],
        [[                                                                       ]],
        greeter,
      }
    end

    local function set_header_spooky(dash)
      local row1 = "                                                                  "
      local greeter = make_greeter(row1)
      dash.section.header.val = {
        row1,
        "                                                                  ",
        "                                                                  ",
        "███▄▄▄▄      ▄████████  ▄██████▄   ▄█    █▄   ▄█    ▄▄▄▄███▄▄▄▄   ",
        "███▀▀▀██▄   ███    ███ ███    ███ ███    ███ ███  ▄██▀▀▀███▀▀▀██▄ ",
        "███   ███   ███    █▀  ███    ███ ███    ███ ███▌ ███   ███   ███ ",
        "███   ███  ▄███▄▄▄     ███    ███ ███    ███ ███▌ ███   ███   ███ ",
        "███   ███ ▀▀███▀▀▀     ███    ███ ███    ███ ███▌ ███   ███   ███ ",
        "███   ███   ███    █▄  ███    ███ ███    ███ ███  ███   ███   ███ ",
        "███   ███   ███    ███ ███    ███ ███    ███ ███  ███   ███   ███ ",
        " ▀█   █▀    ██████████  ▀██████▀   ▀██████▀  █▀    ▀█   ███   █▀  ",
        "                                                                  ",
        "                                                                  ",
        greeter,
      }
    end

    local function set_header_standard(dash)
      local row1 = "                                                     "
      local greeter = make_greeter(row1)
      dash.section.header.val = {
        row1,
        "                                                     ",
        "                                                     ",
        "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
        "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
        "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
        "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
        "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
        "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
        "                                                     ",
        "                                                     ",
        greeter,
      }
    end

    local function set_header_ombre(dash)
      vim.api.nvim_set_hl(0, "NeovimDashboardLogo1", { fg = "#311B92" }) -- Indigo
      vim.api.nvim_set_hl(0, "NeovimDashboardLogo2", { fg = "#512DA8" }) -- Deep Purple
      vim.api.nvim_set_hl(0, "NeovimDashboardLogo3", { fg = "#673AB7" }) -- Deep Purple
      vim.api.nvim_set_hl(0, "NeovimDashboardLogo4", { fg = "#9575CD" }) -- Medium Purple
      vim.api.nvim_set_hl(0, "NeovimDashboardLogo5", { fg = "#B39DDB" }) -- Light Purple
      vim.api.nvim_set_hl(0, "NeovimDashboardLogo6", { fg = "#D1C4E9" }) -- Very Light Purple
      vim.api.nvim_set_hl(0, "NeovimDashboardUsername", { fg = "#D1C4E9" }) -- light purple
      dash.section.header.type = "group"
      dash.section.header.val = {
        {
          type = "text",
          val = "   ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
          opts = { hl = "NeovimDashboardLogo1", shrink_margin = false, position = "center" },
        },
        {
          type = "text",
          val = "   ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
          opts = { hl = "NeovimDashboardLogo2", shrink_margin = false, position = "center" },
        },
        {
          type = "text",
          val = "   ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
          opts = { hl = "NeovimDashboardLogo3", shrink_margin = false, position = "center" },
        },
        {
          type = "text",
          val = "   ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
          opts = { hl = "NeovimDashboardLogo4", shrink_margin = false, position = "center" },
        },
        {
          type = "text",
          val = "   ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
          opts = { hl = "NeovimDashboardLogo5", shrink_margin = false, position = "center" },
        },
        {
          type = "text",
          val = "   ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
          opts = { hl = "NeovimDashboardLogo6", shrink_margin = false, position = "center" },
        },
        {
          type = "padding",
          val = 1,
        },
        {
          type = "text",
          val = "𝙾𝚑 𝚝𝚑𝚎 𝚓𝚘𝚢 𝚘𝚏 𝚑𝚊𝚟𝚒𝚗𝚐 𝚢𝚘𝚞𝚛 𝚘𝚠𝚗 𝚌𝚞𝚜𝚝𝚘𝚖 𝚝𝚎𝚡𝚝 𝚎𝚍𝚒𝚝𝚘𝚛 :)",
          opts = { hl = "NeovimDashboardUsername", shrink_margin = false, position = "center" },
        },
      }
    end

    local function set_header(dash, type)
      if type == "standard" then
        set_header_standard(dash)
      elseif type == "simple" then
        set_header_simple(dash)
      elseif type == "slanted" then
        set_header_slanted(dash)
      elseif type == "spooky" then
        set_header_spooky(dash)
      elseif type == "ombre" then
        set_header_ombre(dash)
      end
    end

    -- [[ Menus ]]
    local menu_standard = function(dash)
      return {
        dash.button("e", "  > New File", "<cmd>ene<CR>"),
        dash.button("SPC ee", "  > Toggle file explorer", "<cmd>NvimTreeToggle<CR>"),
        dash.button("SPC ff", "󰱼 > Find File", "<cmd>Telescope find_files<CR>"),
        dash.button("SPC fs", "  > Find Word", "<cmd>Telescope live_grep<CR>"),
        dash.button("SPC wr", "󰁯  > Restore Session For Current Directory", "<cmd>SessionRestore<CR>"),
        dash.button("q", " > Quit NVIM", "<cmd>qa<CR>"),
      }
    end

    local menu_extended = function(dash)
      return {
        -- dash.button("SPC j", "󰈚   Restore Session", ":SessionRestore<cr>"),
        dash.button(">", "  Toggle file explorer", "<cmd>NvimTreeFocus<CR>"),
        dash.button("i", "   New File", ":ene <BAR> startinsert <CR>"),
        dash.button("f", "   Find File", ":cd $HOME/dotfiles | Telescope find_files<CR>"),
        dash.button("g", "󰱼   Find Word", ":Telescope live_grep<CR>"),
        dash.button("p", "   Projects", "<cmd>Telescope projects<CR>"),
        dash.button("r", "   Files", ":Telescope oldfiles<CR>"),
        dash.button("c", "   Config", ":e ~/.config/nvim<CR>"),
        dash.button("m", "󱌣   Mason", ":Mason<CR>"),
        dash.button("l", "󰒲   Lazy", ":Lazy<CR>"),
        dash.button("u", "󰂖   Update", "<cmd>lua require('lazy').sync()<CR>"),
        dash.button("q", "   Quit NVIM", ":qa<CR>"),
      }
    end

    local menu_minimal = function(dash)
      return {
        dash.button("n", " > New File", "<cmd>ene<CR>"),
        dash.button("f", "󰱼 > Find Files", "<cmd>Telescope find_files<CR>"),
        dash.button("r", " > Find Recent Files", "<cmd>Telescope oldfiles<CR>"),
        dash.button("p", " > Find Projects", "<cmd>Telescope project<CR>"),
        dash.button("c", " > Configuration", "<cmd>edit ~/.config/nvim/init.lua<CR>"),
        dash.button("q", " > Quit NVIM", "<cmd>qa<CR>"),
      }
    end

    local function set_menu(dash, type)
      if type == "standard" then
        dash.section.buttons.val = menu_standard(dash)
      elseif type == "extended" then
        dash.section.buttons.val = menu_extended(dash)
      elseif type == "minimal" then
        dash.section.buttons.val = menu_minimal(dash)
      end
    end

    -- [[ Colorize Header ]]
    -- Make the header a bit more fun with some color!
    local function colorize_header(header)
      local lines = {}

      for i, chars in pairs(header) do
        local line = {
          type = "text",
          val = chars,
          opts = {
            hl = "StartLogo" .. i,
            shrink_margin = false,
            position = "center",
          },
        }

        table.insert(lines, line)
      end

      return lines
    end

    -- [[ Configure Alpha ]]
    -- Set the dashboard theme
    local dashboard = set_theme(dash_theme)

    -- Set the dashboard header
    set_header(dashboard, header_type)

    -- Set the dashboard menu buttons (not valid for startify theme)
    if dash_theme ~= "startify" then
      set_menu(dashboard, menu_type)

      if vim.o.filetype == "lazy" then
        vim.cmd.close()
        vim.api.nvim_create_autocmd("User", {
          pattern = "AlphaReady",
          callback = function()
            require("lazy").show()
          end,
        })
      end
    else
      -- disable MRU
      -- dashboard.section.mru.val = { { type = "padding", val = 0 } }
      -- dashboard.opts.opts = { margin = 25 }
    end

    alpha.setup(dashboard.opts)
    -- alpha.setup({
    --   layout = {
    --     { type = "padding", val = 4 },
    --     { type = "group", val = colorize_header(dashboard.section.header.val) },
    --     { type = "padding", val = 2 },
    --     dashboard.section.buttons,
    --     dashboard.section.footer,
    --   },
    --   opts = { margin = 5 },
    -- })

    -- [[ Footer ]]
    -- Set the dashboard footer
    if dash_theme ~= "startify" then
      vim.api.nvim_create_autocmd("User", {
        once = true,
        pattern = "LazyVimStarted",
        callback = function()
          -- Lazy Stats
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)

          -- Date / Time / Uptime
          local time = vim.fn.strftime("%H:%M:%S")
          local date = vim.fn.strftime("%m.%d.%Y")

          -- Rows
          local row1 = "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms"
          local row2 = "  " .. date .. " | " .. "  " .. time

          local row1_width = vim.fn.strdisplaywidth(row1)
          local row2Padded = string.rep(" ", (row1_width - vim.fn.strdisplaywidth(row2)) / 2) .. row2

          dashboard.section.footer.val = { row1, row2Padded }

          require("nvim-tree.api").tree.open()
          pcall(vim.cmd.AlphaRedraw)
          vim.cmd([[wincmd p]])
        end,
      })
    end

    -- Disable folding on alpha buffer
    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
}
