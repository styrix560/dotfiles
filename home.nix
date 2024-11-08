{config, pkgs, ...}:

{
  programs = import ./home-programs.nix;
  home.stateVersion = "23.11";
}
