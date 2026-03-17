return {
  { -- Open URL under cursor w/ `gx`
    "https://github.com/sontungexpt/url-open",
    event = "VeryLazy",
    cmd = "URLOpenUnderCursor",
    config = function()
      local status_ok, url_open = pcall(require, "url-open")
      if not status_ok then
        return
      end
      url_open.setup({
        extra_patterns = {
          {
            pattern = '["]([^%s]*)["]:%s*"[^"]*%d[%d%.]*"',
            prefix = "https://github.com/",
            suffix = "",
            excluded_file_patterns = nil,
          },
        },
      })
    end,
  },
  { "rrethy/vim-illuminate" },
  { -- Detect / adjust tabbing automatically
    -- (expandtab, shiftwidth, tabstop, textwidth,  endofline, fileformat, filenencoding, bomb)
    "tpope/vim-sleuth",
  },
}
