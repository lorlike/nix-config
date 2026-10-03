{
  plugins.project-nvim.enable = true;
  plugins.neo-tree = {
    enable = true;
    settings.window = {
      width=30;
  		mappings = {
   			"l" = "open";
   			"h" = "close_node";
  		};
    };
  };

  keymaps = [
    {
      action = "<cmd>:Neotree toggle<CR>";
      key = "<leader>e";
      options.desc = "Explorer NeoTree";
    }
    {
      action = "<cmd>:Neotree filesystem reveal left toggle<CR>";
      key = "<leader>E";
      options.desc = "Explorer NeoTree (cwd)";
    }
  ];
}
