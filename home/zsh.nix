{
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    
    shellAliases = {
      aa = "ls -lAh";
      a = "ls -lh";
    };
    history = {
      size = 10000;
    };
    initExtra = ''
      export PATH=/home/work/.dotfiles/scripts:$PATH
      export PATH=/home/work/.cargo/bin:$PATH
      export RUST_BACKTRACE=1
    '';

    oh-my-zsh = {
      enable = true;
      theme = "af-magic";
    };
  }
  