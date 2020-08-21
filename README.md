# nixosrc

# Table of Contents
1. [General](#general)
2. [Installation](#installation)
3. [Configuration Details](#config)
4. [Notes](#notes)

## General <a name="general" />

This is my entire NixOS System configuration. Install instructions are below:

First, make a NixOS bootable drive using the minimal CD (we won't be using xfce). This assumes 20.03 (until further notice) but should work on others. You can obtain that from [here](https://nixos.org/download.html). I recommend [etcher](https://www.balena.io/etcher/) for imaging an installer flash drive.

Boot into the NixOS installer and go through the following:

## Installation <a name="installation" />

- If on wireless networking:
```sh
sudo su # (The install process pretty much entirely requires root)
wpa_supplicant -B -i <WIRELESS_INTERFACE> \
    -c <(wpa_passphrase '<SSID>' '<PASSWORD'>)
```

- Partition disks and mount them with something like:

```sh
# I assume an install drive called nvme0. You can find your current parts with ""sudo parted -l" and list drives with "sudo fdisk -l"

sudo parted /dev/nvme0n1 -- mklabel gpt
sudo parted /dev/nvme0n1 -- mkpart ESP fat32 1MiB 512MiB
sudo parted /dev/nvme0n1 -- set 1 boot on
sudo parted /dev/nvme0n1 -- mkpart primary linux-swap 512MiB 8512MiB
sudo mkswap /dev/nvme0n1p2
sudo swapon /dev/nvme0n1p2
sudo parted /dev/nvme0n1 -- mkpart primary 8512MiB 100%
sudo pvcreate /dev/nvme0n1p3
sudo vgcreate pool /dev/nvme0n1p3
sudo lvcreate -L 96G -n root pool # 96G should just be however big you want your root partition
sudo lvcreate -L 133G -n home pool # 133G should just be however big you want your home partition
sudo mkfs.ext4 -L root /dev/pool/root # You can choose another FS if you hate yourself...
sudo mkfs.ext4 -L home /dev/pool/home
sudo mount /dev/disk/by-label/root /mnt
sudo mkdir -p /mnt/home /mnt/boot
sudo mount /dev/disk/by-label/home /mnt/home
sudo mount /dev/disk/by-label/boot /mnt/boot

# Note the above will probably vary based on your drive configuration
```

- Generate a base config:

```
nixos-generate-config --root /mnt
```

- We won't make many edits to the config because we are going to replace it, but be sure that it contains at least the below:

```nix
# We need at least an editor and git:
environment.systemPackages = with pkgs; [
  neovim
  git
];

# We need a user account:
users.users.novafacing = {
  isNormalUser = true;
  createHome = true;
  home = "/home/novafacing";
  extraGroups = [
    "wheel" # Important!
    "networkmanager" # Arguably more important!
  ];
};
```

This will get us an extremely basic config with just a command line. That's fine, we just want the system installed so that we can deploy our configuration.

- After that's done, do `nixos-install`

- Assuming no errors, `reboot now`

- After rebooting, log in as root and run `passwd novafacing`

- Log out of root with `exit` and log back in as `novafacing`

- Go to /etc/nixos and save the file `hardware-configuration.nix` somewhere safe (your home directory is a good place!).

- Run the following to delete the nixos directory, clone our new configuration, symlink it to our home directory, and enable:

```sh
nix-channel --add https://github.com/rycee/home-manager/archive/master.tar.gz home-manager
nix-channel --update
sudo rm -rf /etc/nixos
sudo git clone https://github.com/novafacing/nixosrc /etc/nixos
sudo ln -s /etc/nixos $HOME/nixos # (or wherever you want)
sudo chown -R novafacing:users $HOME/nixos/
cp hardware-configuration.nix $HOME/nixos/ # copy from wherever you put it
sudo nixos-rebuild switch --upgrade
```

- And we should (theoretically) be done! 

## Configuration Details <a name="config" />

The configuration is organized into a couple toplevel files and directories:

```
.
+-- README.md
+-> Obviously just this readme!
|
+-- configuration.nix
+-> Absolute toplevel configurations. Calls all module configuration.
| > Mostly system-level stuff, both for nixos and the machine.
|
+-- hardware-configuration.nix
+-> Autogenerated during installation. FS info, CPU info, kernel modules.
|
+-- config
+-> Contains global settings that are used in multiple places.
|
+-- modules
+-> The heart of the configuration, holds modules for all my machine config.
|
+-- nixos-private
+-> Has a couple private things I use in my configs.
|
+-- theme
+-> Right now, just a wallpaper. Might have more colorscheme stuff down 
  > the road.
```

Only modules really needs an explanation. If you don't know, importing a directory instead of a .nix file in nixlang will automatically call the default.nix file in that directory. I won't explain default.nix files unless they do something other than import everything else in the directory.

```
.
+-- home
+-> Configuration for home-manager controlled stuff. Most but not all of
| > my GUI programs are managed by home-manager.
|
| +-- i3.nix
| +-> My i3 config, including startup entries for when i3 starts (not the same as system startup)
| +-- kitty.nix
| +-> My terminal config, mostly colorscheme and font really.
| +-- zsh.nix
| +-> My zsh config. This file is huge because I have my whole powerlevel10k config in there. It could be smaller. I don't care.
|
+-- packages
+-> Packages that I need to install for various things. System, CLI, GUI, etc.
|
+-- system
+-> System configs not managed by home-manager. Networking, services, etc.
```

The packages directory is divided into common.nix and custom.nix, which do the obvious things. Most things are organized, like all my neovim config goes in modules/packages/neovim, all python things go in python, node in node, etc.


## Notes <a name="notes" />


A couple things. For node packages, you'll need the node2nix dependency, which is installed by default in `modules/packages/common.nix`. 

To add a _global_ node dependency, just add it to `modules/packages/node/node-packages.json` and run `node2nix -i node-packages.json` in `modules/packages/node`.

A token for github with only notifications permission is expected at `nixos/nixos-personal/github_...etc` You can just remove that expectation from the config for i3 at `modules/home/i3.nix` in the status command option.

To make a windows installer disk, use gparted to format the USB and create a GPT partition scheme. Then, create a single partition formatted as NTFS. Run `sudo woeusb` and click File->Show All Drives. Click NTFS in WoeUSB and a windows ISO. and click install. Done :) This isn't really a nixos thing but since this is my main OS notes why not ;)

To find a package that provides a file, install `nix-index` with configuration or with `nix-env -iA nixos.nix-index` and run `sudo nix-index`. Then to find a provider, run `nix-locate -w libz.so.1`.

Really important: do NOT install things like `libgit2` globally in common.nix! This is a really easy way to screw up impure nix-shell build environments! And we don't like that!

To install OBS browser plugin:

1. Install obs-studio and obs-linuxbrowser

2. `mkdir -p ~/.config/obs-studio/plugins`

3. `ln -s /nix/store/hrqm3r1ihlc26wpbnhcmzl6l0cbk6c8r-obs-linuxbrowser-0.6.1-6-gf86dba6/share/obs/obs-plugins/obs-linuxbrowser ~/.config/obs-studio/plugins/` (or whatever your path to that dir is).

To install OBS-NDI Plugin:

1. Just install this repo...

2. mkdir -p ~/.config/obs-studio/plugins/obs-ndi/bin/64bit/

3. ln -s /nix/store/rdy508cg2x95xnflxk3jbqhmw5f0q382-obs-ndi-4.7.1/lib/obs-plugins/obs-ndi.so ~/.config/obs-studio/plugins/obs-ndi/bin/64bit/obs-ndi.so

## How to clean up

NixOS is amazing but it blows up your hard drive a lot if you `--update` too much. To reduce the size:

1. `nix-env --delete-generations old`
2. `nix-collect-garbage -d`
2. `nix-store --optimize`
