#!/bin/bash
# Author(s): Dylan Turner <dylantdmt@gmail.com>
# Description:
# - The script that the aios-themer.service will run
# - Checks for themes for all users and installs defaults if they do not exist

DEF_FLDR=/etc/default/aios-theme
DEF_APPS=(alacritty appimaged firefox libreoffice-fresh-basic mupdf neovim thunar)
DEF_APP_FLDR=/etc/default/apps
NVIM_PLUGINS=(ale auto-pairs coc.nvim deoplete-clang deoplete.nvim fzf.vim lightline.vim markdown-preview.nvim nerdcommenter nerdtree nvim-lspconfig rust-tools.nvim ultisnips vim vim-devicons vim-godot vim-snippets vim-startify vimtex zig.vim)

# For each user in the home dir, do the check
getent passwd | while IFS=: read -r name password uid gid gecos home shell; do
    # Install neovim for root user bc it's useful
    if [ "$name" = "root" ]; then
        if [ ! -d "/root/Applications" ]; then
            mkdir -p /root/Applications
            chown -R $name:$name /root/Applications
        fi
        if [ -d "/root/Applications" ]; then
            if [ ! -f "/root/Applications/aip_man_pkg_list.json" ]; then
                cp $DEF_APP_FLDR/aip_man_pkg_list.json /root/Applications
                chown -R $name:$name /root/Applications
            fi
            for app in ${DEF_APPS[@]}; do
                if [ ! -f "/root/Applications/$app"* ]; then
                    cp $DEF_APP_FLDR/$plugin* /root/Applications/
                    chown -R $name:$name /root/Applications
                    chmod +x /root/Applications/$plugin*
                fi
            done
        fi
    fi

    # Skip users that aren't PEOPLE users
    if [[ "$home" != "/home"* ]]; then
        continue
    fi

    # Change to zsh
    if [[ "$shell" != *"zsh" ]]; then
        chsh -s /usr/bin/zsh $name
        reboot
    fi

    # Zsh theming requires Zsh obvs
    if [[ "$shell" = *"zsh" ]]; then
        # Zsh completions
        if [ ! -d "$home/.zsh-completions" ]; then
            cp -r $DEF_FLDR/zsh-completions $home/.zsh-completions
            chown -R $name:$name $home/.zsh-completions
        fi

        # Remove default zsh
        ZSHRC_LINE=`cat $home/.zshrc | tr '\n' ' '`
        if [[ "$ZSHRC_LINE" = "# # .zshrc is sourced in interactive shells."* ]]; then
            rm $home/.zshrc
        fi

        # Zsh theme
        if [ -d "$home/.zsh-completions" ]; then
            if [ ! -f "$home/.zshrc" ]; then
                cp $DEF_FLDR/.zshrc $home/.zshrc
                chown $name:$name $home/.zshrc
            fi
        fi
    fi

    # Default AppImages
    if [ ! -d "$home/Applications" ]; then
        mkdir -p $home/Applications
        chown -R $name:$name $home/Applications
    fi
    if [ -d "$home/Applications" ]; then
        if [ ! -f "$home/Applications/aip_man_pkg_list.json" ]; then
            cp $DEF_APP_FLDR/aip_man_pkg_list.json $home/Applications
            chown -R $name:$name $home/Applications
        fi
        for app in ${DEF_APPS[@]}; do
            if [ ! -f "$home/Applications/$app"* ]; then
                cp $DEF_APP_FLDR/$plugin* $home/Applications/
                chown -R $name:$name $home/Applications
                chmod +x $home/Applications/$plugin*
            fi
        done
        su $name -c "aipman run appimaged"
    fi

    if [ -f "$home/Applications/neovim"* ]; then
        # Nvim config
        if [ ! -f "$home/.config/nvim/init.vim" ]; then
            mkdir -p $home/.config/nvim
            cp $DEF_FLDR/init.vim $home/.config/nvim/init.vim
            chown -R $name:$name $home/.config/nvim
        fi

        # Python neovim
        su $name -c "pip install neovim --user"

        # Plug.vim
        if [ -f "$home/.config/nvim/init.vim" ]; then
            if [ ! -f $home/.local/share/nvim/site/autoload/plug.nvim ]; then
                mkdir -p $home/.local/share/nvim/site/autoload/
                cp $DEF_FLDR/plug.vim $home/.local/share/nvim/site/autoload
                chown -R $name:$name $home/.local
            fi
        fi

        # Nvim plugins
        if [ ! -d "$home/.vim/plugged" ]; then
            mkdir -p $home/.vim/plugged
            chown -R $name:$name $home/.vim
        fi
        for plugin in ${NVIM_PLUGINS[@]}; do
            if [ ! -d "$home/.vim/plugged/$plugin" ]; then
                cp -r $DEF_FLDR/$plugin $home/.vim/plugged/$plugin
            fi
        done
        su $name -c "$home/Applications/neovim* -es -u init.vim -i NONE -c 'PlugInstall' -c 'qa'"
    fi

    # Xfce4 Panel
    if [ ! -d "$home/.config/xfce4" ]; then
        mkdir -p $home/.config
        cp -r $DEF_FLDR/xfce4 $home/.config
        chown -R $name:$name $home/.config/xfce4
    fi

    # i3
    if [ ! -f "$home/.config/i3" ]; then
        mkdir -p $home/.config/i3
        cp $DEF_FLDR/config $home/.config/i3
        chown -R $name:$name $home/.config/i3
    fi
    if [ ! -d "$home/Applications/i3-alternating-layout" ]; then
        mkdir -p $home/Applications
        cp -r $DEF_FLDR/i3-alternating-layout $home/Applications
        chown -R $name:$name $home/Applications/i3-alternating-layout
    fi

    # Rofi
    if [ ! -f "$home/.config/rofi" ]; then
        mkdir -p $home/.config/rofi
        cp $DEF_FLDR/config.rasi $home/.config/rofi
        chown -R $name:$name $home/.config/rofi
    fi

    # Alacritty
    if [ ! -f "$home/.config/alacritty/alacritty.yml" ]; then
        mkdir -p $home/.config/alacritty
        cp $DEF_FLDR/alacritty.yml $home/.config/alacritty
        chown -R $name:$name $home/.config/alacritty/
    fi

    # Gtk Themes
    if [ ! -f "$home/.gtkrc-2.0" ]; then
        cp $DEF_FLDR/.gtkrc-2.0 $home
        chown $name:$name $home/.gtkrc-2.0
    fi
    if [ ! -d "$home/.config/gtk-3.0" ]; then
        mkdir -p $home/.config
        cp -r $DEF_FLDR/gtk-3.0 $home/.config
        chown -R $name:$name $home/.config/gtk-3.0
    fi
    if [ ! -d "$home/.config/gtk-4.0" ]; then
        mkdir -p $home/.config
        cp -r $DEF_FLDR/gtk-4.0 $home/.config
        chown -R $name:$name $home/.config/gtk-4.0
    fi

    # The manual
    if [ ! -f "$home/Documents/aios-manual.pdf" ]; then
        mkdir -p $home/Documents
        cp $DEF_FLDR/aios-manual.pdf $home/Documents
        chown -R $name:$name $home/Documents
    fi

    chown -R $name:$name $home
done

