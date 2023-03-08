#!/bin/bash
# Needs to have dos2nix run against it before pushing to github.
# ToDo
# Add encryption
# Add BIOS boot option, currently only UEFI is supported.

while getopts "d:s:" flag;
do
        case "${flag}" in
          d) DISK=${OPTARG};;

          s) SWAP="${OPTARG:=8}GiB"
        esac
done

# Partition disk with boot partition, root partition, and swap space.
parted -s -a optimal -- ${DISK} \
        mklabel gpt \
        mkpart ESP fat32 0% 512MiB \
        name 1 boot\
        mkpart primary 512MiB -1GiB \
        name 2 root\
        mkpart primary linux-swap -1GiB 100% \
        name 2 SWP
        set 1 esp on 

# Make filesystems on newly partitioned disk
mkfs.fat -F -L boot 32 "${DISK}1"
mkfs.btrfs -L root "${DISK}2"
mkswap -L swp "${DISK}3"
mount -t btrfs "${DISK}2" /mnt

# Encrypt the root partition

# Create btrfs subvols - flat layout
# btrfs subvol create /mnt/@
# btrfs subvol create /mnt/@snapshots
# btrfs subvol create /mnt/@home
# btrfs subvol create /mnt/@var_log
# btrfs subvol create /mnt/@var_lib_docker

btrfs subvol create /mnt/@
btrfs subvol create /mnt/@snapshots
btrfs subvol create /mnt/@home
btrfs subvol create /mnt/@nix

# Unmount btrfs partition 
umount /mnt

# Make directories for mounting
# mkdir /mnt/{home,.snapshots,var}
# mkdir /mnt/var/{lib,log}
# mkdir /mnt/var/lib/docker



# mount -o subvol=@var_lib_docker,compress=zstd,noatime "${DISK}2" /mnt/var/lib/docker
# mount -o subvol=@var_log,compress=zstd,noatime "${DISK}2" /mnt/var/log
# mount -o subvol=@snapshots,compress=zstd,noatime "${DISK}2" /mnt/.snapshots
# mount -o subvol=@home,compress=zstd,noatime "${DISK}2" /mnt/home
# mount -o subvol=@,compress=zstd,noatime "${DISK}2" /mnt/

mount -o subvol=@,compress=zstd,noatime "${DISK}2" /mnt/
mkdir /mnt/{nix,home,.snapshots}
mount -o subvol=@snapshots,compress=zstd,noatime "${DISK}2" /mnt/.snapshots
mount -o subvol=@nix,compress=zstd,noatime "${DISK}2" /mnt/nix
mount -o subvol=@home,compress=zstd,noatime "${DISK}2" /mnt/home
