{
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    extraConfig = ''
      set number
      set relativenumber
    '';
  };
}
