{ lib, pkgs, ... }:
# this is a test comment
let
username = "shkoki";
in
{
  home = {
    packages = with pkgs; [
      hello
    ];

    # This needs to actually be set to your username
    inherit username;
    homeDirectory = "/home/${username}";

    # You do not need to change this if you're reading this in the future.
    # Don't ever change this after the first build.  Don't ask questions.
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
      font.size = 13;
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
