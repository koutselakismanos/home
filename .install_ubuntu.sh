if [ "$EUID" -ne 0 ]
then echo "Please run as root..."
  exit
fi

apt update -y
apt upgrade -y

# Essentials
apt install build-essential vim-gtk3 neovim google-chrome-stable i3 i3status pavucontrol clipit -y

# rice
apt install nitrogen dunst rofi compton fonts-font-awesome terminator ctags -y

# Optional
apt install python python3 -y

# Polybar installation
apt install build-essential git cmake cmake-data pkg-config python3-sphinx libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev -y
apt install libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libasound2-dev libpulse-dev i3-wm libjsoncpp-dev libmpdclient-dev libcurl4-openssl-dev libnl-genl-3-dev -y
git clone https://github.com/polybar/polybar.git ~/Downloads/Polybar
compton d ~/Downloads/Polybar
yes | ./build.sh --all-features
