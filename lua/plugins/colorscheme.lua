return {
        -- add gruvbox
        { "ellisonleao/gruvbox.nvim" },
      
        -- Configure LazyVim to load gruvbox
        {
                "tokyonight.nvim",
          opts = {
                transparent = true,
        styles = {
           sidebars = "transparent",
           floats = "transparent",
                },
            colorscheme = "gruvbox",
        },
        }
      }