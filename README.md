# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim). Refer to
the [documentation](https://lazyvim.github.io/installation) to get started.

## Updating

`:Lazy sync` from inside nvim, or headless if the config is too broken to start:

```sh
nvim --headless "+Lazy! sync" +qa
```

This updates LazyVim itself _and_ its dependencies. Updating LazyVim alone
leaves plugins like `snacks.nvim` behind and startup fails with missing-module
errors.

Later:

bash`:checkhealth nvim-treesitter bash`

New extras only appear in `:LazyExtras` once LazyVim is current — a stale
checkout simply has no file for them.

### If Treesitter Throws Query Errors

Old master-branch installs leave untracked `parser/` and `parser-info/`
directories in the plugin, which shadow the current parsers in
`~/.local/share/nvim/site/parser`:

```sh
rm -rf ~/.local/share/nvim/lazy/nvim-treesitter/parser \
       ~/.local/share/nvim/lazy/nvim-treesitter/parser-info
```
