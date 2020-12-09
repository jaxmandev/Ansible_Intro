# Infrastructure as code
## Ansible

It can create:
- Machines, 
- Environments, or 
- Architecture. 

Two catagories of tools : 
1. Configuration management & 
2. Orchestration.


### Configuration Management
```
1. They help configure and test machines to a specific state.

2. They also help with the maintaining of this system.
- Puppet
- Chef
- Ansible 
(Push configuration management)

3. They help provision
- Install/Update packages
- Config Files
- Environment variables
- Start and Enable services

4. They have a Controller Agent/Host relationship
5. Packer or Ansible --> create AMI
```

### Orchestration

Once we have a machine image, orchestration tools are used to deploy these into more complex environments. 
```
These tools focus on networking and architecture rather than the configuration of individual machines. They focus more on the environment these machines run.
```
1. Terraform
2. Ansible
3. Cloud Formation

4. They help provision
- Creating subnets
- NACL
- IGW
- SG
Networking components in general
Other services (Autoscaling, monitoring)


## Ansible Intro

- Configuration management Software
```
Allows you to make changes to machines in a declarative way, through a "push" system
```
- Ansible host connects to your servers. 
- Sending out its playbooks, that runs through its plays to provision the servers. 

An ansible host can be anything from your laptop to a github repository. 

- Agnostic platform - Less vendor locking

With the Ansible abstraction layer, means you can:
- run the code in any environment for any OS and it will know how to install and pERform the operation.
```
e.g
- ubuntu uses apt
- Centos uses dnf or yum
- IOs Brew others
```
#### Testing strategies

If you use ansible language in your playbook - clarification: Not bash
Then it will automatically 
1. Install/configure 
2. Test that it did do the action
3. If the test fails it will break


### Instructions

#### Ansible controller

- Set up as an EC2 instance. 
- The security group needs to be unique to the controller and set so we can ssh in from our ip.
- Install ansible and associated dependancies in EC2 using ansible_bash.sh (see repo)
- Copy your AWS ssh key into your ansible controller using
```
scp -i ~/.ssh/newpairaws.pem newpairaws.pem ubuntu@<ip-public>:~/
```

#### Ansible Host

- Set up as an EC2 instance. 
- The security group needs allow an ssh in from any instance with the ansible controller security group.


Connecting to hosts

1. ssh into the ansible controller instance
2. cd to and edit the hosts file /etc/ansible/ so we can specify to connect to a host in it, using the private ip
[host_a]
3. run
```
<host private IP> ansible_connection=ssh ansible_ssh_private_key_file=/home/ubuntu/.ssh/eng74samawskey.pem
```
- To check the connection is made run the following command
```
ansible host_a -m ping
```
- You can ping all hosts using
```
ansible all -m ping
```

#### Ansible ad-hoc commands 
Can be used in our ansible controller to communicated with our hosts 

- get the uptime with
```
ansible all -a uptime --become
```
- update and upgrade environments
```
ansible host_a -m apt -a "upgrade=yes update_cache=yes" --become
```

- Our first playbook

Connect our host a to an SQL DB.
1. run in the ~/ of the ansible controller
```
mkdir playbooks
```
2. create a file and look at sql db connection playbook to see what to include. It would explain the commands in the # comments (see SQL_YAML doc)

- Once created we can run the command below to execute the playbook
```
ansible-playbook sql_connection.yaml
```
