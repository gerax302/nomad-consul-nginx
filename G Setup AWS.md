# Custom steps for AWS

### EC2 Settings 
Centos7 AMI:	ami-6e28b517
Centos7 AMI of:	ami-0ff760d16d9497662
Type:			t2.small 


### Configure Ansible 2.7 or 2.8 in RedHat 7 / Centos (not needed, just need python in centos servers, no ansible)
For RedHat 7 you can install Ansible by enabling the epel repo. Use the following commands:

sudo rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo yum -y install ansible



#### Run playbook

Example: ansible-playbook playbook.yaml

ansible-playbook -v --private-key=/Users/you/.ssh/your_key deployFile.yml

Used: 
ansible-playbook -v --private-key=/Users/gerardo/Documents/key-pair-aws-ireland/DOU-GRH-KPFile.pem nomad.yml -i inventoryAWS


### Changes 
- Updated Nomad version 05 to 07 Nomad
    - Due this,  checksum also needed the change in the values
- Changed    ansible_eth1(ansible_eth1.ipv4.address)   deprecated to **ansible_eth0.ipv4.address** ansible_default_ipv4 
- Ansible 2.8 MacOs computer
- Enable selinux @Centos7 
    + setenforce 0 = Mode: permissive - SELinux prints warnings instead of enforcing.
    + Restart Centos
    + Check status with: sestatus
- Run playbook 
