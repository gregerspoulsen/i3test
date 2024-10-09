# This file is overwritten by the vagrant-nixos plugin
{ config, pkgs, ... }:
{
  services = {
    xserver = {
      enable = true;
      desktopManager.xterm.enable = false;

      # home-manager 側で i3 の設定するために必要
      desktopManager.session = [
        {
          name = "home-manager";
          start = ''
            ${pkgs.runtimeShell} $HOME/.hm-xsession &
            waitPID=$!
          '';
        }
      ];

      layout = "dk";
#      xkbVariant = "OADG109A";
      #videoDrivers = [ "nvidia" ];

      exportConfiguration = true;
    };

    logind.lidSwitch = "ignore";
  };
}
