#! /bin/sh
while getopts S:R: options; do
        case $options in
                S) x=$OPTARG
                git clone https://aur.archlinux.org/${x}
                cd ${x}
                makepkg -si
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
