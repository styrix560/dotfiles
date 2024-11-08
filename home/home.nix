{config, pkgs, ...}:

{
  programs.zsh = import ./zsh.nix;
  programs.waybar = import ./waybar/waybar.nix;
  programs.home-manager.enable = true;
  home.stateVersion = "23.11";
}
