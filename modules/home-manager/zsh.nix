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
  };
}
