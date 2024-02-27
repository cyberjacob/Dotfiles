## Clone
```bash
git clone --bare https://github.com/girlpunk/Dotfiles $HOME/.cfg
git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout
git --git-dir=$HOME/.cfg/ --work-tree=$HOME submodule init
git --git-dir=$HOME/.cfg/ --work-tree=$HOME submodule update
```

## Update
```bash
config pull
```

## Recommended Packages
```bash
apt install gpg curl
curl -fsSL https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor -o /usr/share/keyrings/packages.microsoft.gpg
curl -fsSL https://apt.releases.hashicorp.com/gpg            | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

# deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com bookworm main
# deb [signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/debian/12/prod bookworm main

apt update
apt install apt-transport-https bind9-dnsutils build-essential docker.io dos2unix dotnet-sdk-8.0 git git-lfs imagemacick jq neofetch pipenv pngcrush terraform tmux wget whois zip zsh
```

## Change Shell
```bash
usermod --shell $(which zsh) $(whoami)
```
