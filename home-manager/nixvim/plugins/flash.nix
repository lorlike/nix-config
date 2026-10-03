{
  plugins.flash = {
    enable = true;
    settings = {};
  };

  keymaps = [
    {
      mode = [ "n" "x" "o" ];
      key = "s";
      action.__raw = "function() require('flash').jump() end";
      options.desc = "Flash";
    }
    # {
    #   mode = [ "n" "x" "o" ];
    #   key = "S";
    #   action.__raw = "function() require('flash').treesitter() end";
    #   options.desc = "Flash Treesitter";
    # }
  ];
}
