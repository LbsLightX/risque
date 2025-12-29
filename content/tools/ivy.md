+++
title = "ivy"
+++

ivy is my custom nix configuration for neovim. it uses [nvfetcher] for plugin
management and [lynn.nvim] for plugin configuration.

run via nix:

```bash
nix run github:comfysage/ivy
```

## components

### `pkgs/`

this directory contains the nix packages within the setup. the most important
are `ivy-plugins` and `ivy`. `ivy-plugins` is a special package that merges the
[nvfetcher] sources and treesitter grammars needed. it also included some
`vimPlugin`'s from nixpkgs for plugins that require build steps - like
`blink.cmp`.

`pkgs/ivy/` is a neovim wrapper for the setup. it uses [gift-wrap], which is a
special nix wrapper for neovim that makes including your own lua configuration
really easy and simple.

### `config/`

this is the actual lua configuration. this directory will get copied to the nix
store and used as the config for the wrapper.

this directory contains some special subdirectories: `lua/ivy/init.lua` is the
entry point for the configuration. `lua/ivy/plugins/` is a special directory
that specifies the plugin specs for [lynn.nvim]. `lua/ivy/config` contains
custom neovim options and settings. `config/` contains the setup options for
all the plugins and will get sourced automatically by [lynn.nvim]. `plugin/`
contains some small plugin scripts that i've written.

`lsp/` contains the lsp options for some lsp's that aren't supported by
[nvim-lspconfig] or need some special settings. `snippets/` contains custom
snippets; these will get merged with snippets from [friendly-snippets]

[lynn.nvim]: https://github.com/comfysage/lynn.nvim
[nvfetcher]: https://github.com/berberman/nvfetcher
[gift-wrap]: https://github.com/tgirlcloud/gift-wrap
[nvim-lspconfig]: https://github.com/neovim/nvim-lspconfig
[friendly-snippets]: https://github.com/rafamadriz/friendly-snippets
