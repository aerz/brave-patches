# Brave patches

This is a collection of patches for Brave or Chromium to repair annoying things or applyu small details. Also, a compiled version of Brave with all patches applied it's included to use this repository as third party pacman repository.

All the patches are found at [patches](patches) folder.

# Installation

## Apply patch and compile

```sh
git clone https://gitlab.com/aerz/brave-patches.git
cd brave-patches
make patch/gtk-dark
paru brave
```

By using [paru](https://github.com/Morganamilo/paru), it will apply the patches in future updates once the commit was done in the package repository.

## Use third party repository

Import my personal PGP key:

```sh
pacman-key --recv-keys ED300246E4E5D0BE --keyserver keyserver.ubuntu.com
pacman-key --lsign-key ED300246E4E5D0BE
```

Add the repository in `/etc/pacman.conf`:

```ini
[aerz-pkgs]
Server = https://aerz.gitlab.io/$repo/$arch
```

Then, update Pacman database and install patched Brave.

```sh
pacman -Syy
pacman -S aerz-pkgs/brave
```

# Patches

## GTK dark/light switch mode

`patches/gtk-dark-mode-switch-fix.patch`

This patch fixes a bug reported in Chromium long time ago. Once applied, the browser will
update `prefers-color-scheme` when theme change between light and dark.

- Bug: https://bugs.chromium.org/p/chromium/issues/detail?id=998903
- Source: [qcasey/chromium-patches](https://github.com/qcasey/chromium-patches/blob/main/patches/gtk-dark-mode-switch-fix.patch)

# Related

- https://github.com/Morganamilo/paru
- https://aur.archlinux.org/packages/brave/
- https://wiki.archlinux.org/index.php/Patching_packages
