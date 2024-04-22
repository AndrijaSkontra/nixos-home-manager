{ lib, pkgs, ... }:
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
}
