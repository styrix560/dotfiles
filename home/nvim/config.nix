{
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    vimAlias = true;

    extraConfig = ''
      set number
      set relativenumber

      set tabstop=2
      set shiftwidth=0
      set expandtab
    '';
  };
}
