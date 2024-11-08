{
  zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    
    shellAliases = {
      ll = "ls -lAh";
      l = "ls -lh";
    };
    history = {
      size = 10000;
      path = "~/.config/zsh/history";
    };
  };
  home-manager.enable = true;
}
