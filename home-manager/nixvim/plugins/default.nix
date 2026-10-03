{
  plugins.lualine.enable = true;
  plugins.blink-pairs.enable = true;
  plugins.gitsigns.enable = true;

  imports = [
    ./theme.nix
    ./lsp.nix
    ./format.nix
    ./cmp.nix
    ./bufferline.nix
    ./neo-tree.nix
    # telescope
    ./flash.nix
  #   # mini
    ./which-key.nix
  #   # trouble
  #   # treesitter
    ./noice.nix
    ./terminal.nix
    ./lazygit.nix
  ];


}
