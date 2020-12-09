# ansible install
sudo apt update
sudo apt install software-properties
sudo apt-add-repository --yes --update ppa:ansible/ansibke
sudo apt install ansible -yes

# python install and dependencies

sudo apt install python -yes
sudo apt install python-pip -yes
sudo pip --upgrade pip -y

# install other tools
pip3 install awscli
sudo pip install boto -yessudo pip install boto3 -y