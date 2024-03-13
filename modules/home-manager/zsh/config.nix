{...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -Alh --group-directories-first";
      l = "ls -l --group-directories-first";
      ls = "ls --color=tty";
    };
    initExtra = ''
      fpath+=~/dotfiles/modules/home-manager/zsh/.zfunc/_rustup
    '';

    oh-my-zsh = {
      enable = true;
      theme = "af-magic";
    };
  };
}
