{
  plugins.bufferline = {
    enable = true;
    settings.options = {
      offsets = {
				filetype = "neo-tree";
				text = "Neo-tree";
				highlight = "Directory";
				text_align = "left";
  		};
    };
  };

  keymaps = [
    {
      key = "<leader>bd";
      action = "<cmd>bdelete<cr>";
      options.desc = "Delete Buffer";
    }
    {
      key = "<S-h>";
      action = "<cmd>bprevious<cr>";
      options.desc = "Prev Buffer";
    }
    {
      key = "<S-l>";
      action = "<cmd>bnext<cr>";
      options.desc = "Next Buffer";
    }
  ];
}
