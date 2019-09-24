# Nomad-Consul-Nginx Project 

Environment for automatice creation of Nomad cluster with consul and nginx on AWS using and ansible and TFE.

## Changes 
- Nomad updated version 05 to 07 Nomad
- Changed ansible_eth1(ansible_eth1.ipv4.address) deprecated to **ansible_eth0.ipv4.address** or ansible_default_ipv4 
- Local workstation: Ansible 2.8 MacOs computer
- Enable **selinux** Centos7 
    + setenforce 0 = Mode: permissive - SELinux prints warnings instead of enforcing.
    + Restart Centos
    + Check status with: sestatus
- Run playbook 

#### EC2 Settings 
- Centos7 AMI:	ami-6e28b517 (core)
- Centos7 AMI:	ami-0ff760d16d9497662 (official & used)
- Type:			t2.small 


### Planning infrastructure 

- 6 EC2 instances with Terraform on AWS
- Assign IPv4 addressses to the inventory File (inventoryAWS).
- Run the playbook as mentioned in the next section. It is gonna run the ansible-roles on the corresponding nodes, according to the category designated.  


#### Running playbook

Example: `ansible-playbook playbook.yaml`

Example on AWS: `ansible-playbook -v --private-key=/Users/you/.ssh/your_key deployFile.yml`

Used: 
`ansible-playbook -v --private-key=/Users/gerardo/kp-aws-path/file.pem nomad.yml -i inventoryAWS`

---

### Cluster commands

```
consul members 
consul monitor

nomad status
nomad server-members
nomad node-status

nomad init
nomad run example.nomad 
nomad status
nomad status example
nomad alloc status [allocation-id]

nomad run hello-docker.nomad
nomad status hello-docker
Una vez lanzado el job, ve a la URL/hello-docker

nomad run hello-java.nomad
nomad status hello-java

```
**Comandos adicionales**
```
#Logs
nomad logs [allocation-id] 

#Error logs 
nomad logs -stderr [allocation-id] 

#Drain (maintenance)
nomad node-drain -enable -self 

#Namespaces 
nomad namespaces list 

```

### Raft testing 
- Stop an instance from your cluster (leader as preference)
  - Run `consul members`
  - Another machine will take leadership responsability.
- Stop a client instance (allocation running)
  - Jobs must be sent to another node.



---
### GUI
**Access to the Consul UI:**  http://cluster-public-IPv4-ip:8500/ui 

**Access to the Nomad UI:**  http://cluster-public-IPv4-ip:4646/ui 

---

### Final observations

**Modifications:** @gerax302

**Forked from:**
https://www.adictosaltrabajo.com/tutoriales/nomad-despliegue-y-supervision-sencilla-de-aplicaciones/



