return {
  "nvim-mini/mini.nvim",
  version = false,
  config = function()
    require("mini.surround").setup()
    require("mini.comment").setup()
    require("mini.pairs").setup()
    
    require("mini.jump").setup()
    require("mini.jump2d").setup()
    require("mini.files").setup({
      windows = { preview = true, width_preview = 40 },
    })
    vim.keymap.set("n", "<leader>f", function() MiniFiles.open() end, { desc = "Open MiniFiles" })
    require("mini.sessions").setup({
      autoread = true,
      autowrite = true,
    })

    require("mini.animate").setup({
      scroll = { enable = true },
      resize = { enable = true },
      cursor = { enable = true },
    })
    require("mini.completion").setup()
  end,
}

