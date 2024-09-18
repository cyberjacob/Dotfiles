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
### Linux
```bash
apt install gpg curl
curl -fsSL https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor -o /usr/share/keyrings/packages.microsoft.gpg
curl -fsSL https://apt.releases.hashicorp.com/gpg            | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

# deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com bookworm main
# deb [signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/debian/12/prod bookworm main

apt update
apt install \
  apt-transport-https \
  bind9-dnsutils build-essential \
  docker.io dos2unix dotnet-sdk-8.0 \
  git git-lfs \
  imagemacick \
  jq \
  neofetch \
  pipenv pngcrush \
  terraform tmux \
  wget whois \
  zip zsh
```

### Windows
```powershell
winget install \
  7zip.7zip \
  Adobe.Acrobat.Reader.64-bit \
  Bitwarden.Bitwarden Bitwarden.CLI \
  dbeaver.dbeaver Debian.Debian Docker.DockerDesktop \
  errata-ai.Vale ExclaimerLtd.CloudSignatureUpdateAgent \
  Figma.Figma \
  GIMP.GIMP Git.Git GitHub.GitLFS \
  Hashicorp.Terraform \
  Inkscape.Inkscape \
  JAMSoftware.TreeSize JanDeDobbeleer.OhMyPosh jetbrains.dotTrace JetBrains.ReSharper JetBrains.Toolbox \
  Lenovo.ServiceBridge Lenovo.SystemUpdate LINQPad.LINQPad.7 \
  Microsoft.AppInstaller Microsoft.Azure.FunctionsCoreTools Microsoft.Azure.StorageExplorer Microsoft.AzureCLI \
  Microsoft.DotNet.AspNetCore.7 Microsoft.DotNet.AspNetCore.8 \
  Microsoft.DotNet.HostingBundle.7 Microsoft.DotNet.HostingBundle.8 \
  Microsoft.DotNet.Runtime.7 Microsoft.DotNet.Runtime.8 \
  Microsoft.DotNet.SDK.7 Microsoft.DotNet.SDK.8 \
  Microsoft.Edge \
  Microsoft.GitCredentialManagerCore \
  Microsoft.Office Microsoft.OneDrive Microsoft.OpenJDK.11 Microsoft.OpenSSH.Beta \
  Microsoft.PowerAppsCLI Microsoft.PowerAutomateDesktop Microsoft.PowerBI Microsoft.PowerShell \
  Microsoft.Teams \
  Microsoft.VisualStudio.2022.Professional Microsoft.VisualStudioCode \
  Microsoft.WindowsTerminal \
  OpenJS.NodeJS OpenVPNTechnologies.OpenVPN \
  Postman.Postman \
  RoyalApps.RoyalTS.V7 \
  ShareX.ShareX SlackTechnologies.Slack Sway \
  tailscale.tailscale \
  voidtools.Everything \
  WinSCP.WinSCP WiresharkFoundation.Wireshark
```

## Change Shell
```bash
usermod --shell $(which zsh) $(whoami)
```
