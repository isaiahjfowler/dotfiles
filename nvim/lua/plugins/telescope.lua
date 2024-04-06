return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
     dependencies = { 'nvim-lua/plenary.nvim' },
     config = function()
          require("telescope").setup {
            extensions = {

            ["ui-select"] = {
              require("telescope.themes").get_dropdown {}
                -- even more opts
              },
              file_browser = {
                layout_config = {
                  width = 0.99,
                  height = 0.99,
                },

                -- disables netrw and use telescope-file-browser in its place
                hijack_netrw = true,
                mappings = {
                  ["i"] = {
                    -- your custom insert mode mappings
                  },
                  ["n"] = {
                    -- your custom normal mode mappings
                  },
                },
              },
            },
          }
          -- To get telescope-file-browser loaded and working with telescope,
          -- you need to call load_extension, somewhere after setup function:
          require("telescope").load_extension "file_browser"
          require("telescope").load_extension("ui-select")
   end
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  },

  { "nvim-telescope/telescope-ui-select.nvim" }
}
