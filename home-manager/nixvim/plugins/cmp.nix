{
  plugins.blink-cmp = {
    enable = true;
    settings ={
      keymap = {
        preset = "enter";
        "<Tab>" = [
          "select_next"
    			"snippet_forward"
    			"fallback"
        ];
        "<S-Tab>" = [
          "select_prev"
        ];
      };
      completion = {
    		menu.border = "single";
    		documentation.window.border = "single";
     	};
      signature.window.border = "single";
    };
  };
}
