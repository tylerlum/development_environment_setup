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

# Setup zshrc
echo "=========================="
echo "Setting up zshrc"
echo "=========================="
apt-get install -y git  # If not already installed
git clone https://github.com/tylerlum/zshrc.git ${full_path_to_directory}/zshrc
ln -s ${full_path_to_directory}/zshrc/.zshrc ~/.zshrc

# Setup vimrc
echo "=========================="
echo "Setting up vim"
echo "=========================="
apt-get install -y git  # If not already installed
git clone https://github.com/tylerlum/vim_configuration.git ${full_path_to_directory}/vim_configuration
ln -s ${full_path_to_directory}/vim_configuration/.vimrc ~/.vimrc

# Setup tmux
# echo "=========================="
# echo "Setting up tmux"
# echo "=========================="
# apt-get install -y tmux  # If not already installed
# echo "if [ -z "$TMUX" ]" >> ~/.zshrc
# echo "then" >> ~/.zshrc
# echo "    tmux attach -t TMUX || tmux new -s TMUX$" >> ~/.zshrc
# echo "fi" >> ~/.zshrc
# ln -s ${full_path_to_directory}/.tmux.conf ~/.tmux.conf

# Setup COVID-19 project environment
# echo "=========================="
# echo "Setting up COVID-19 project environment"
# echo "=========================="
# cd /home/tylergwlum/covid19_pocus_ultrasound/
# source covid_env/bin/activate
# cd pocovidnet
# echo "cd /home/tylergwlum/covid19_pocus_ultrasound/" >> ~/.zshrc
# echo "source covid_env/bin/activate" >> ~/.zshrc
# echo "cd pocovidnet" >> ~/.zshrc
