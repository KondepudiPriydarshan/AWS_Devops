#!/bin/bash

USERNAME="devops"

# 1) Create user if not exists
if ! id "$USERNAME" &>/dev/null; then
    sudo useradd -m -s /bin/bash "$USERNAME"
fi

# 2) Create SSH directory
sudo mkdir -p /home/$USERNAME/.ssh
sudo chmod 700 /home/$USERNAME/.ssh
sudo chown $USERNAME:$USERNAME /home/$USERNAME/.ssh

# 3) Allow passwordless sudo for this user
echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/$USERNAME
sudo chmod 440 /etc/sudoers.d/$USERNAME

# 4) Use the vagrant default insecure public key
VAGRANT_KEY_SRC="/home/vagrant/.ssh/authorized_keys"
VAGRANT_KEY_DST="/home/$USERNAME/.ssh/authorized_keys"

if [ -f "$VAGRANT_KEY_SRC" ]; then
    sudo cp "$VAGRANT_KEY_SRC" "$VAGRANT_KEY_DST"
    sudo chmod 600 "$VAGRANT_KEY_DST"
    sudo chown $USERNAME:$USERNAME "$VAGRANT_KEY_DST"
fi

echo "User $USERNAME created and SSH access enabled."

