sudo apt update -y
sudo apt upgrade -y

sudo apt install -y vim curl git zsh build-essential

# Docker

for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done

sudo apt get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo usermod -aG docker $USER

# OhMyZsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Java 21

sudo apt install -y openjdk-21-jdk


# Display results

sudo docker run hello-world
java --version
