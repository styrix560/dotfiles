{config, pkgs, ...}:

{
  programs.zsh = import ./zsh.nix;
  programs.waybar = import ./waybar/waybar.nix;

  programs.direnv = {
    enable = true;
    enableZshIntegration = true; # see note on other shells below
    nix-direnv.enable = true;
  };

  programs.home-manager.enable = true;
  home.stateVersion = "23.11";
}
