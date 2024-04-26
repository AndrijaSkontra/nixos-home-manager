{ lib, pkgs, ... }:
let
username = "shkoki";
in
{
  home = {
    packages = with pkgs; [
      hello
    ];

    inherit username;
    homeDirectory = "/home/${username}";

    stateVersion = "23.11";
  };

  programs = {
    
    alacritty = {
      enable = true;
      settings = {
        window.opacity = 0.8;
      };
    };

    bash = {
      enable = true;
      shellAliases = {
        butcrack = "ls -a";
        sise = "sudoedit /etc/nixos/configuration.nix";
        sisb = "sudo nixos-rebuild switch";
        nvime = "nvim ~/.config/nvim/init.lua";
      };
      bashrcExtra = ''
        eval "$(oh-my-posh init bash --config ~/ohjson.omp.json)"
      '';
    };

    git = {
      enable = true;
      userName = "AndrijaSkontra";
      userEmail = "askontra22@student.unizd.hr";
      extraConfig.credential.helper = "store";
    };

    kitty = {
      enable = true;
      font.package = pkgs.nerdfonts;
      font.name = "FiraCodeNerdFontMono";
      font.size = 12;
      settings = {
        background_opacity = "0.6";
        background_blur = 25;
        active_border_color = "#ad7575";
      };
    };

  };

  # wayland.windowManager.hyprland = {
  #   enable = true;
  #   enableNvidiaPatches = true;
  # };

}
