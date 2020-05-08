# nixosrc

This is my entire NixOS System configuration. Install instructions are below:

First, make a NixOS bootable drive using the minimal CD (we won't be using xfce). This assumes 20.03 (until further notice) but should work on others.

Boot into the NixOS installer and go through the following:

- If on wireless networking:
```sh
sudo su # (The install process pretty much entirely requires root)
wpa_supplicant -B -i <WIRELESS_INTERFACE> \
    -c <(wpa_passphrase '<SSID>' '<PASSWORD'>)
```

- Partition disks and mount them with something like:

```sh
sudo parted /dev/nvme0n1 -- mklabel gpt
sudo parted /dev/nvme0n1 -- mkpart ESP fat32 1MiB 512MiB
sudo parted /dev/nvme0n1 -- set 1 boot on
sudo parted /dev/nvme0n1 -- mkpart primary linux-swap 512MiB 8512MiB
sudo mkswap /dev/nvme0n1p2
sudo swapon /dev/nvme0n1p2
sudo parted /dev/nvme0n1 -- mkpart primary 8512MiB 100%
sudo pvcreate /dev/nvme0n1p3
sudo vgcreate pool /dev/nvme0n1p3
sudo lvcreate -L 96G -n root pool
sudo lvcreate -L 133G -n home pool
sudo mkfs.ext4 -L root /dev/pool/root
sudo mkfs.ext4 -L home /dev/pool/home
sudo mount /dev/disk/by-label/root /mnt
sudo mkdir -p /mnt/home /mnt/boot
sudo mount /dev/disk/by-label/home /mnt/home
sudo mount /dev/disk/by-label/boot /mnt/boot
# Note the above WILL vary based on your drive configuration
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
