return {
  {
    "MeanderingProgrammer/markdown.nvim",
    name = "render-markdown",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-web-devicons"
    },
    ft = { "markdown" },
    config = function()
      require("render-markdown").setup({})
    end,
  }
}

