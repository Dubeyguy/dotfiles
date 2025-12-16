return {
  "vimwiki/vimwiki",
  init = function()
    -- This function runs before the plugin is loaded.
    -- It's the ideal place to set global variables that vimwiki needs.

    -- By default, vimwiki files are stored in ~/vimwiki/
    -- We are configuring it to use Markdown syntax and .md file extension.
    vim.g.vimwiki_list = {
      {
        path = "~/vimwiki",
        syntax = "markdown",
        ext = ".md",
      },
    }

    -- You can add more wikis if you like, for example, for work.
    -- vim.g.vimwiki_list = {
    --   {path = "~/vimwiki/personal", syntax = "markdown", ext = ".md"},
    --   {path = "~/vimwiki/work", syntax = "markdown", ext = ".md"},
    -- }
  end,
}
