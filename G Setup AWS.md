# Custom steps for AWS

### EC2 Settings 
Centos7 AMI:	ami-6e28b517 (core)
Centos7 AMI of:	ami-0ff760d16d9497662 (official)
Type:			t2.small 


### Changes 
- Updated Nomad version 05 to 07 Nomad
    - Due this,  checksum also needed the change in the values
- Changed    ansible_eth1(ansible_eth1.ipv4.address)   deprecated to **ansible_eth0.ipv4.address** or ansible_default_ipv4 
- Ansible 2.8 MacOs computer
- Enable selinux @Centos7 
    + setenforce 0 = Mode: permissive - SELinux prints warnings instead of enforcing.
    + Restart Centos
    + Check status with: sestatus
- Run playbook 


#### Running playbook

Example: ansible-playbook playbook.yaml

Example on AWS: ansible-playbook -v --private-key=/Users/you/.ssh/your_key deployFile.yml

Used: 
ansible-playbook -v --private-key=/Users/gerardo/kp-aws-path/file.pem nomad.yml -i inventoryAWS



#### Access to the cluster
- Select server IP http://cluster1ip:8500/ui 

#### Additional Info
**Configure Ansible 2.7 or 2.8 in RedHat 7 / Centos**
For RedHat 7 you can install Ansible by enabling the epel repo. Use the following commands:

```
sudo rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo yum -y install ansible

```