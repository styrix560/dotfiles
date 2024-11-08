{
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
    initExtra = ''
      export PATH=/home/work/.dotfiles/scripts:$PATH
      export PATH=/home/work/.cargo/bin:$PATH
    '';

    oh-my-zsh = {
      enable = true;
      theme = "af-magic";
    };
  }