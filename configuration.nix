{ config, pkgs, ... }:

{ imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true; boot.loader.efi.canTouchEfiVariables = true;

  # networking.hostName = "nixos"; # Define your hostname. Pick only one of the below
  # networking options. networking.wireless.enable = true; # Enables wireless support via
  # wpa_supplicant. networking.networkmanager.enable = true; # Easiest to use and most
  # distros use this by default.

  # Set your time zone. time.timeZone = "Europe/Amsterdam";

  # Configure network proxy if necessary networking.proxy.default =
  # "http://user:password@proxy:port/"; networking.proxy.noProxy =
  # "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties. i18n.defaultLocale = "en_US.UTF-8"; console = {
  #   font = "Lat2-Terminus16"; keyMap = "us"; useXkbConfig = true; # use xkbOptions in tty.
  # };

  # Enable the X11 windowing system. services.xserver.enable = true;

  # Configure keymap in X11 services.xserver.layout = "us"; services.xserver.xkbOptions = {
  #   "eurosign:e"; "caps:escape" # map caps to escape.
  # };

  # Enable CUPS to print documents. services.printing.enable = true;

  # Enable sound. sound.enable = true; hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Users
  users.users.matt = {
    isNormalUser = true;
    uid = 1000;
    home = "/home/matt";
    extraGroups = ["wheel"];
    openssh.authorizedKeys.keys = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIN6t1HsiC73L/kiItOWw9VplBxehc91PhLuRzcJ0XTOq"];
  };
  
  system.stateVersion = "22.11"; # Did you read the comment?
  environment = {
    systemPackages = with pkgs; [
      vim
    ];
  };
}
