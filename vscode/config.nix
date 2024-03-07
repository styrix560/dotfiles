{
  lib,
  config,
  pkgs,
  ...
}: let
  vscode-pkgs = [
  ];
in {
  environment.systemPackages = with pkgs; [
    (vscode-with-extensions.override {
      vscodeExtensions = with vscode-extensions;
        [
          # known packages
        ]
        ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        ];
    })
  ];
}
