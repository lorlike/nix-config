{
  imports = [
    ./lsp.nix
    ./theme.nix
    ./neo-tree.nix
    ./terminal.nix
    ./bufferline.nix
    ./format.nix
  ];

  plugins.gitsigns.enable = true;


  plugins.treesitter = {
    enable = true;
    settings = {
      highlight.enable = true;
      indent.enable = true;
    };
  };

  plugins.which-key = {
    enable = true;
    settings.preset = "helix";
  };

}
