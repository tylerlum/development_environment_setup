#!/usr/bin/env bash
# Sets up development environment for RCL COVID-19 project.
# Should be run from the same directory as this file.

full_path_to_directory="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Install debian packages
echo "=========================="
echo "Installing debian packages"
echo "=========================="
apt-get update
cat ${full_path_to_directory}/my_debian_dependencies.txt | xargs apt-get install -y

# Setup zsh: https://www.howtoforge.com/tutorial/how-to-setup-zsh-and-oh-my-zsh-on-linux/
echo "=========================="
echo "Setting up zsh"
echo "=========================="
apt-get install -y zsh  # If not already installed
chsh -s /usr/bin/zsh root
apt install -y wget git  # If not already installed
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh

# Setup vimrc
echo "=========================="
echo "Setting up vim"
echo "=========================="
apt-get install -y git  # If not already installed
git clone https://github.com/tylerlum/vim_configuration.git ${full_path_to_directory}/vim_configuration
ln -s ${full_path_to_directory}/vim_configuration/.vimrc ~/.vimrc

# Setup COVID-19 project environment
echo "=========================="
echo "Setting up COVID-19 project environment"
echo "=========================="
cd /home/tylergwlum/covid19_pocus_ultrasound/
source covid_env/bin/activate
cd pocovidnet
echo "cd /home/tylergwlum/covid19_pocus_ultrasound/" >> ~/.zshrc
echo "source covid_env/bin/activate" >> ~/.zshrc
echo "cd pocovidnet" >> ~/.zshrc
