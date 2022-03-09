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
                echo "Install Complete"
                ;;
                #removal
                R) y=$OPTARG
                if [ "$(id -u)" != 0 ]; then
                echo "You have to run this script as a root"
                exit 1
                fi
                pacman -R ${y}
                echo "Removal Complete"
                ;;
        esac
done
