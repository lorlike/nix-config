{
  colorschemes.tokyonight={
    enable = true;
    settings = {
      style = "storm";
      on_highlights = ''
        function(hl, _)
          hl.LineNrAbove = { fg = "#888888" }
      		hl.LineNrBelow = { fg = "#888888" }
        end
      '';
    };
  };
}
