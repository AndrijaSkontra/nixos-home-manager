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

    git = {
      enable = true;
      userName = "AndrijaSkontra";
      userEmail = "askontra22@student.unizd.hr";
      extraConfig.credential.helper = "store";
    };

    kitty = {
      enable = true;
      # font.name = "FiraCode"; this doesn't work
    };

  };

  # wayland.windowManager.hyprland = {
  #   enable = true;
  #   enableNvidiaPatches = true;
  # };

}
