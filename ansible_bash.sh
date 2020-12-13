# ansible install
sudo apt update
sudo apt install software-properties
sudo apt-add-repository --yes --update ppa:ansible/ansibke
sudo apt install ansible -yes

# python install and dependencies

sudo apt install python -yes
sudo apt install python-pip -yes
sudo pip --upgrade pip -y

# install other aws tools
pip3 install awscli # aws command line interface ----> allows us to
pip3 install boto
pip3 install boto3

# get the uptime of this command
ansible all -a uptime --become
# update and upgrade packages
ansible host_a -m apt -a "upgrade=yes update_cache=yes" --become
