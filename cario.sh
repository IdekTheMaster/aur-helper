#! /bin/sh
while getopts S:R: options; do
        case $options in
                S) x=$OPTARG
                if [[ -d ~/.cache/cario/ ]]; then
                cd ~/.cache/cario/
                if [[ -d ~/.cache/cario/${x} ]]; then 
                rm -rf ~/.cache/cario/${x}
                fi
                git clone https://aur.archlinux.org/${x}
                cd ~/.cache/cario/${x}
                makepkg -si
                else
                mkdir ~/.cache/cario/
                cd ~/.cache/cario/
                git clone https://aur.archlinux.org/${x}
                cd ~/.cache/cario/${x}
                makepkg -si
                fi
                echo -n '- Installation Complete.\n'
                ;;
                #removal
                R) y=$OPTARG
                if [[ -e /usr/bin/sudo ]]; then
                sudo pacman -R ${y}
                else
                doas pacman -R ${y}
                fi
                echo -n '- Removal complete.\n'
                ;;
        esac
done
