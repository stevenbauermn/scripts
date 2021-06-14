# ELK-Stack-Deployment
Scripts, diagrams and documentation used to deploy an ELK Stack deployment in Azure.

## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.
![Azure ELK Stack Diagram](./images/azure_elk_stack_diagram.png)

These files have been tested and used to generate a live ELK Stack deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the `yml` files may be used to install only certain pieces of it, such as Filebeat.

[Install DVWA Web Server Playbook](./dvwa/install-dvwa.yml)

[Install ELK Stack Server Playbook](./ELK/install-elk.yml)

[Install Filebeat Syslog Service Playbook](./Filebeat/filebeat-playbook.yml)

[Install Docker Metrics Service Playbook](./Metricbeat/metricbeat-playbook.yml)

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting access to the network. Load balancers are also one way to mitigate a DoS as it can balance the load accress many web application servers. Typically load balancers include a **health probe** to check all of the servers in its pool are functioning appropiately before sending traffic to them or it will stop sending traffic to missing or poor perfoming servers.

A Jump Box is similar to a gateway router as it becomes a single point of a protected network exposed to the public network as it sits in front of the other machines that are not exposed to the Internet. To further control access only specified IP addresses and port `22` are allowed access to the Jump Box. SSH has it is security issues and that is why asynchronous encryption keys were used to esnure a higher degree of protection than usernames and passwords. 

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the machine metrics and system logs. 

Filebeat is used to capture system logs or file locations you specifiy then sending them to the ELK Server for indexing and review.

Metricbeat is used to capture machine metircis on Linux, Windows, and Mac hosts then forwarding to the ELK Server to track system level CPU usuage, memory, file system, disk I/O, and network I/O metrics.

The configuration details of each machine may be found below.

| Name       | Function    |   IP Address   | Operating System   |
|------------|-------------|----------------|--------------------|
| PSG358-20  | Workstation | 67.4.81.30     | Windows 10 Pro     |
| Jump Box   | Gateway     | 10.0.0.4       | Linux Ubuntu 20.04 |
| web-1      | DVWA        | 10.0.0.5       | Linux Ubuntu 20.04 |
| web-2      | DVWA        | 10.0.0.6       | Linux Ubuntu 20.04 |
| web-3      | DVWA        | 10.0.0.7       | Linux Ubuntu 20.04 |
| elk-server | ELK Stack   | 10.1.0.4       | Linux Ubuntu 20.04 |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump Box machine can accept connections from the Internet. Access to this machine is only allowed from the following Internet IP addresses: 67.4.81.30

Machines within the network can only be accessed by the Jump Box with the private IP address 10.0.0.4.

A summary of the access policies in place can be found in the table below.

| Name       | Publicly Accessible |  Allowed IP Addresses   |
|------------|---------------------|-------------------------|
| PSG358-20  | Yes                 | 10.0.0.0/16 10.1.0.0/16 |
| Jump Box   | Yes                 | 10.0.0.0/16 10.1.0.0/16 |
| web-1      | No                  | 10.0.0.0/16 10.1.0.0/16 |
| web-2      | No                  | 10.0.0.0/16 10.1.0.0/16 |
| web-3      | No                  | 10.0.0.0/16 10.1.0.0/16 |
| elk-server | No                  | 10.0.0.0/16 10.1.0.0/16 |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because it simplified deployment from a central location that can be used to expand or redeploy ELK machines just by running an Ansible playbook.

The playbook implements the following tasks:
- Install Docker, Python, and the Docker Module.
- Configure the ELK Server memory.
- Download Docker ELK Container and configure it.

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.
![docker ps results](./images/docker_ps_output.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- 10.0.0.5
- 10.0.0.6
- 10.0.0.7

We have installed the following Beats on these machines:
- Filebeat
- Metricbeat

These Beats allow us to collect the following information from each machine:
- System and application log details such Web Traffic is gathered by Filebeat.
- CPU, Memory, Disk, and Network and other top-like statics gathered Metricbeat.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the configuration file to the `/etc/ansible/files/` to make configuration changes.
- Update the `/etc/ansible/hosts` file to include the targeted mahcine or machines.
- Create the `<role>-playbook.yml` file with the required tasks to be run by `ansible-playbook`.
- Run the playbook then navigate to the ELK Server Kibana data installation page to check the `Module status` that the installation worked as expected.

_TODO: Answer the following questions to fill in the blanks:_
- _Which file is the playbook? Where do you copy it?_ The Ansible playbook files were `<role>-playbook.yml` files located on the Jump Server whithin the Ansible Docker container in the `/etc/ansible/roles/` folder.
- _Which file do you update to make Ansible run the playbook on a specific machine? How do I specify which machine to install the ELK server on versus which to install Filebeat on?_ To target specific machines we edited the `/etc/ansible/hosts` by ensuring `[header]` element is not commited and is folled by the `hostname/IP` of the machines being managed by Ansible.
Navigating to http://104.210.155.66/app/kibana successfully ensures the ELK Server is running and is ready for use. 

_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._

