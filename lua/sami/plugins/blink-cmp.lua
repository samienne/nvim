local has_words_before = function()
  local col = vim.api.nvim_win_get_cursor(0)[2]
  if col == 0 then
    return false
  end
  local line = vim.api.nvim_get_current_line()
  return line:sub(col, col):match("%s") == nil
end

return {
  'saghen/blink.cmp',
  -- optional: provides snippets for the snippet source
  dependencies = { 'rafamadriz/friendly-snippets' },

  -- use a release tag to download pre-built binaries
  version = '1.*',
  -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
  -- build = 'cargo build --release',
  -- If you use nix, you can build from source using latest nightly rust with:
  -- build = 'nix run .#build-plugin',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
    -- 'super-tab' for mappings similar to vscode (tab to accept)
    -- 'enter' for enter to accept
    -- 'none' for no mappings
    --
    -- All presets have the following mappings:
    -- C-space: Open menu or open docs if already open
    -- C-n/C-p or Up/Down: Select next/previous item
    -- C-e: Hide menu
    -- C-k: Toggle signature help (if signature.enabled = true)
    --
    -- See :h blink-cmp-config-keymap for defining your own keymap
    keymap = {
        preset = 'default',
        ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
        ['<C-e>'] = { 'hide', 'fallback' },

        --['<Tab>'] = { 'insert_next', 'fallback' },
        ['<Tab>'] = {
                --[[
            function(cmp)
                if has_words_before() then
                    if cmp.get_selected_item() ~= nil and not cmp.is_menu_visible() then
                        cmp.insert_prev()
                        cmp.show({ initial_selected_item_idx = cmp.get_selected_item_idx() })
                        cmp.show_documentation()
                        return true
                    end

                    return cmp.insert_next()
                end
            end,
                --]]
                'show_and_insert',
                'insert_next',
            'fallback'
        },
        ['<S-Tab>'] = { 'insert_prev', 'fallback' },
        --['<Up>'] = { 'select_prev', 'fallback' },
        --['<Down>'] = { 'select_next', 'fallback' },
        --['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
        --['<C-n>'] = { 'select_next', 'fallback_to_mappings' },

            ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
            ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },

        ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
    },

    signature = {
            enabled = true,
    },

    appearance = {
      -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = 'mono'
    },

    completion = {
            documentation = {
                auto_show = true,
                window = {
                    border = "rounded",
                },
            },
        ghost_text = {
            enabled = true,
            show_with_selection = true,
            show_without_selection = true,
                show_with_menu = false,
            show_without_menu = true,
        },
        menu = {
                auto_show = false,
            border = "rounded",
        },
        list = {
            selection = {
                preselect = false,
                auto_insert = true,
            }
        },
    },

    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      default = {
          'lsp',
          'path',
          -- 'snippets',
          -- 'buffer'
      },
    },

    cmdline = {
        --keymap = { preset = 'inherit' },
        completion = {
            ghost_test = {
                enabled = true,
                show_with_selection = true,
                show_without_selection = true,
                show_with_menu = true,
                show_without_menu = true,
            },
            menu = {
                    auto_show = false,
            },
            list = {
                selection = {
                    preselect = false,
                    auto_insert = true,
                }
            },
        },
    },
    -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
    -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
    -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
    --
    -- See the fuzzy documentation for more information
    fuzzy = { implementation = "prefer_rust_with_warning" }
  },
  opts_extend = { "sources.default" }
}
