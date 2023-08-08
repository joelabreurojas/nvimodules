-- Fuzzy Finder (files, lsp, etc)
return {
  "nvim-telescope/telescope.nvim",
  lazy = true,
  cmd = "Telescope",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    -- Add extension
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  keys = {
    { "<leader>?", "<cmd>Telescope oldfiles<CR>", desc = "[?] Find recently opened files" },
    { "<leader> ", "<cmd>Telescope buffers<CR>", desc = "[ ] Find [B]uffers" },
    {"<leader>/", function()
      require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, { desc = "[/] Fuzzily search in current buffer" }},
    { "<leader>gf", "<cmd>Telescope git_files<CR>", desc = "[G]it [F]iles" },
    { "<leader>sf", "<cmd>Telescope find_files<CR>", desc = "[S]earch [F]iles" },
    { "<leader>sh", "<cmd>Telescope help_tags<CR>", desc = "[S]earch [H]elp" },
    { "<leader>sw", "<cmd>Telescope grep_string<CR>", desc = "[S]earch current [W]ord" },
    { "<leader>sg", "<cmd>Telescope live_grep<CR>", desc = "[S]earch by [G]rep" },
    { "<leader>sd", "<cmd>Telescope diagnostics<CR>", desc = "[S]earch Diagnostics" },
  },
  opts = {
    defaults = { file_ignore_patterns = { ".git/", "node_modules" } },
    extensions = {
      -- Initialize extension
      fzf = {
	fuzzy = true,
	override_generic_sorter = true,
	override_file_sorter = true,
	case_mode = "smart_case",
      },
    },
  },
  config = function()
    -- Enable extension
    require "telescope".load_extension "fzf"
  end,
}
