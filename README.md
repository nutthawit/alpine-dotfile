Clone the repository

```sh
DF="/home/${USER}/.dotfile"
git clone https://github.com/nutthawit/alpine-dotfile.git $DF
```

Increase foot font size

```sh
stow -v foot
```

Create user level sway config file

```sh
stow -v sway
```

Install desired packages

```sh
doas cat << EOF >> /etc/apk/world
btop
git
lazygit
stow
mold
openssl-dev
lldb
clang21-dev
bear
EOF

doas apk fix
doas cp "${DF}/etc/ashrc" /etc/ashrc
```

> Precedence between `/etc/ashrc` and `.ashrc`
> - System-Defined Base: The system first establishes its essential settings (like security requirements, mandatory functions, or default terminal coloring) via /etc/ashrc.
> - User Overrides: The user's settings in ~/.ashrc are then loaded, allowing them to override or augment any setting established by the system.


> Build dependencies
> - `mold` will be the default linker to complie Rust
> - `openssl-dev` is required to build `sccache`
> - `lldb` is required to build *Helix*
> - `clang21-dev` provide a `clangd` and `bear` is a tool that generates a compilation databae for clang. Both required for *Clang LSP*

Install Rust complier

```sh
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --profile default --no-modify-path -y

# Add ${HOME}/.cargo/bin into PATH
source /etc/ashrc
```

Build sccache

```sh
RUSTC_WRAPPER= cargo install sccache --locked --quiet
```

Build Helix

```sh
git clone https://github.com/helix-editor/helix ~/helix
mkdir -p ~/.config/helix/runtime
export HELIX_RUNTIME=~/.config/helix/runtime
cargo install --path ~/helix/helix-term --locked --quiet
mv -v ~/helix/runtime/* ~/.config/helix/runtime/

# Install Rust LSP
rustup component add rust-analyzer

# Bringing environment variables, EDITOR, and aliases into scope
source /etc/ashrc
```

Install fzf

```sh
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --key-bindings --completion --no-update-rc
```

Build alacritty

```sh
# sudo dnf install -y fontconfig-devel
cargo install alacritty --quiet --locked
mkdir -p ~/.config/alacritty/themes
git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes

mkdir /tmp/ibm-font /tmp/jetbrain-font ~/.local/share/fonts

# install JetBrainsMono
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/JetBrainsMono.zip -O /tmp/jetbrain-font/JetBrainsMono.zip
cd /tmp/jetbrain-font
unzip -q JetBrainsMono.zip
cp *.ttf ~/.local/share/fonts/

# install IBMPlexMono
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/IBMPlexMono.zip -O /tmp/ibm-font/IBMPlexMono.zip
cd /tmp/ibm-font
unzip -q IBMPlexMono.zip
cp *.ttf ~/.local/share/fonts/

cd ~/.dotfile
stow -v alacritty
```

Build bat

```sh
# sudo dnf install -y oniguruma-devel
RUSTONIG_SYSTEM_LIBONIG=1 cargo install bat --locked --quiet
```

Build startship

```sh
cargo install starship --quiet --locked
```

Build zoxide

```sh
cargo install zoxide --quiet --locked
source /etc/ash
```

Build termusic

```sh
#sudo dnf install protobuf-compiler alsa-lib-devel -y
#cargo install termusic termusic-server --quiet --locked
```

Update sway to used builded packages, create user-level ash config and add my scripts

```sh
stow --override=.config/sway/config sway1
stow -v scripts
stow -v sh
```

Make some binary available called by doas

```sh
sudo ln -sv $HOME/.cargo/bin/hx /usr/local/bin/hx
sudo ln -sv $HOME/.cargo/bin/bat /usr/local/bin/bat
```
