{config, pkgs, ...}:

{
  programs.zsh = import ./zsh.nix;
  programs.waybar = import ./waybar/waybar.nix;

  programs.direnv = {
    enable = true;
    enableZshIntegration = true; # see note on other shells below
    nix-direnv.enable = true;
  };

  programs.helix = {
    enable = true;
    languages = {
        rust = {
          auto-format = true;
          formatter.command = "cargo fmt";
        };
      };
  };

  programs.home-manager.enable = true;
  home.stateVersion = "23.11";
}
