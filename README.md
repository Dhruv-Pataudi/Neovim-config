# Personal Neovim Config

This is a ready-to-install Neovim Configuration, its curated for workflow and effeciency.

## Prerequisites
All you need is:
*   **[Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim)**
*   Git
*   A **[Nerd Font](https://www.nerdfonts.com/font-downloads)**

## Installation
First you need to install Neovim

If you are using:
### Arch(btw)
Use:
```
sudo pacman -S neovim
```
### Debian/Ubuntu
Use:
```
sudo apt update
sudo apt install neovim
```
### Fedora
Use:
```
sudo dnf install neovim
```
### openSUSE
```
sudo zypper in neovim
```
### Gentoo
```
emerge -a app-editors/neovim
```

Installation is easy, you just need to clone the repo into:
```
~/.config/nvim
```

But before installing, create back-up for your current neovim configuration using:
```
mv ~/.config/nvim ~/.config/nvim_backup
```

Then launch Neovim using:
```
nvim
```
On launch, it would automatically install the plugins and then you are good to go...!

Feel free to make changes or report any problems.

Cheers!!
