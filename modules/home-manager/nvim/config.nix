{
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    vimAlias = true;

    extraConfig = ''
      set number
      set relativenumber

      set tabstop=4
      set shiftwidth=4
      set expandtab
    '';
  };
}
