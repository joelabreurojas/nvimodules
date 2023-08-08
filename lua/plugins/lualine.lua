-- Set lualine as statusline
return {
  "nvim-lualine/lualine.nvim",
  lazy = false,
  -- See `:help lualine.txt`
  opts = {
    options = {
      icons_enabled = false,
      theme = "nord",
      component_separators = "|",
      section_separators = "",
    },
  },
}
