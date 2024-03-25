{
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    vimAlias = true;

    extraConfig = ''
      set number
      set relativenumber
    '';
  };
}
