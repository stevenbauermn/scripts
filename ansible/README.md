## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![Azure ELK Stack Diagram](./images/azure_elk_stack_diagram.png)

These files have been tested and used to generate a live ELK Stack deployment within Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the `yml` files may be used to install only certain pieces of it, such as Filebeat.

[Used `dvwa-playbook.yml` to install DVWA Web Servers.](./dvwa/dvwa-playbook.yml)

[Used `elk-playbook.yml` to install ELK Stack Server.](./ELK/elk-playbook.yml)

[Modified `filebeat-config.yml` which was copied to the web servers `filebeat.yml` to configure what Filebeat monitors.](./Filebeat/filebeat-config.yml)

[Used `filebeat-playbook.yml` to install Filebeat Syslog Service on web servers.](./Filebeat/filebeat-playbook.yml)

[Modifired `metricbeat-config.yml` which was copied to the web server as `metricbeat.yml` to configure Metricbeat service.](./Metricbeat/metricbeat-config.yml)

[Used `metricbeat-playbook.yml` to install Metricbeat Metrics Service on web servers](./Metricbeat/metricbeat-playbook.yml)

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

Only the Jump Box machine can accept connections from the Internet. Access to this machine is only allowed from the following Internet IP addresses: 67.4.81.30.

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

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance:
![docker ps results](./images/docker_ps_output.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
```bash
10.0.0.5
10.0.0.6
10.0.0.7
```

Only these Beats were install on these machines:
- Filebeat
- Metricbeat

These Beats allow us to collect the following information from each machine:
- System log and application log details which include details such as Web Traffic is gathered by Filebeat.
- CPU, Memory, Disk, and Network and other top-like statics gathered Metricbeat.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the configuration file to the `/etc/ansible/files/` to make configuration changes.
- Update the `/etc/ansible/hosts` file to include the targeted mahcine or machines.
- Create the `<role>-playbook.yml` file with the required tasks to be run by `ansible-playbook`.
- Run the playbook then navigate to the ELK Server Kibana data installation page to check the `Module status` that the installation worked as expected.

The Ansible playbook files were `<role>-playbook.yml` files located on the Jump Server whithin the Ansible Docker container in the `/etc/ansible/roles/` folder.

To update specific machines we edited the `/etc/ansible/hosts` by ensuring `[header]` element is not commeneneted out with a `#` or needs to be creaed then add the `hostname/IP` of the machines being updated by Ansible.

Navigating to http://104.210.155.66/app/kibana successfully ensures the ELK Server is running and is ready for use. 
### Commands used to install the ELK Stack, Filebeat, and Metricbeat.
#### Install the ELK Stack on the elk server 
##### 1. Connected to the Jump Box and attach to the Ansible Container
  - SSH into into the Jump-Box using `ssh sysadmin@20.80.23.88`

  - Locate the container name:
```bash
sysadmin@Jump-Box-Provisioner:~$ sudo docker container list -a
CONTAINER ID   IMAGE                          COMMAND                  CREATED       STATUS                   PORTS     NAMES                     
34a0f498a3fc   cyberxsecurity/ansible         "/bin/sh -c /bin/bas…"   2 weeks ago   Exited (0) 4 hours ago             eager_ramanujan
```

  - Start the container:
```bash
sysadmin@Jump-Box-Provisioner:~$ sudo docker container start eager_ramanujan
root@34a0f498a3fc:~#
```

  - Attach (connect) to the Ansible container:
```bash
sysadmin@Jump-Box-Provisioner:~$ sudo docker container attach eager_ramanujan
root@34a0f498a3fc:~#
```

##### 2. Update the Ansible `hosts` file and create `yml` playbook file
  - Add the ELK Server IP address to the Ansible `/etc/ansible/hosts` file creating an `[elk]` section with the IP address:
  
  - Open `hosts` file:
```bash
root@34a0f498a3fc:~# nano /etc/ansible/hosts
```
  
  - Add the `[elk]` section followed by the ELK Server IP address:
```bash
[elk]
10.1.0.4
```

- Create the Ansible playbook used to install and configure the `elk` container on the ELK Server virtual machine.
```bash
root@34a0f498a3fc:~# nano /etc/ansible/roles/elk-playbook.yml
```

  - The tasks added in order to the [`elk-playbook.yml`](./ELK/elk-playbook.yml) file install and setup the ELK Stack. 
    - Comments noted by the `#` indicate each task being performed.
##### 3. Running the Playbook and testing the results
  - Run the Ansible playbook:
```bash
root@34a0f498a3fc:/etc/ansible/roles# ansible-playbook elk-playbook.yml

PLAY [Configure Elk VM with Docker] ****************************************************

TASK [Gathering Facts] *****************************************************************
ok: [10.1.0.4]

TASK [Install docker.io] ***************************************************************
changed: [10.1.0.4]

TASK [Install python3-pip] *************************************************************
changed: [10.1.0.4]

TASK [Install Docker module] ***********************************************************
changed: [10.1.0.4]

TASK [Increase virtual memory] *********************************************************
changed: [10.1.0.4]

TASK [Increase virtual memory on restart] **********************************************
changed: [10.1.0.4]

TASK [download and launch a docker elk container] **************************************
changed: [10.1.0.4]

TASK [Enable service docker on boot] **************************************
changed: [10.1.0.4]

PLAY RECAP *****************************************************************************
10.1.0.4                   : ok=1    changed=7    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0 
```

  - After the ELK container is installed, SSH to your container and double check that your `elk-docker` container is running.
```bash
root@34a0f498a3fc:/etc/ansible/roles# ssh sysadmin@10.1.0.4
sysadmin@elk:~$ sudo docker ps
CONTAINER ID    IMAGE         COMMAND                  CREATED      STATUS         PORTS                                                                              NAMES
302324cc1367   sebp/elk:761   "/usr/local/bin/star…"   9 days ago   Up 2 minutes   0.0.0.0:5044->5044/tcp, 0.0.0.0:5601->5601/tcp, 0.0.0.0:9200->9200/tcp, 9300/tcp   elk
sysadmin@elk-server:~$
```

  - First, make sure the ELK server container is up and running.
    - Navigate to http://104.210.155.66:5601/app/kibana to verfiy the ELK Stack is running
      - Use the public IP address of the ELK server from Azure.

##### Installing Filebeat on the web server virtual machines
##### 1. Create the Filebeat Configuration File
  - Steps start while `attached` to the Ansible container on the Jump box.
    - See previous `1. Connected to the Jump Box and attach to the Ansible Container`

  - Copy filebeat-config.yml to the Ansible container.
 ```bash
 root@6160a9be360e:/etc/ansible# curl https://gist.githubusercontent.com/slape/5cc350109583af6cbe577bbcc0710c93/raw/eca603b72586fbe148c11f9c87bf96a63cb25760/Filebeat > /etc/ansible/files/filebeat-config.yml
   % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                  Dload  Upload   Total   Spent    Left  Speed
 100 73112  100 73112    0     0   964k      0 --:--:-- --:--:-- --:--:--  964k
 ```

Once you have this file on your Ansible container, edit this file as specified in the Filebeat instructions (the specific steps are also detailed below). 

Edit the configuration in this file to match the settings described in the installation instructions for your server.

- **Hint:** Instead of using Ansible to edit individual lines in the `/etc/filebeat/filebeat-config.yml` configuration file, it is easier to keep a copy of the entire configuration file (preconfigured) with your Ansible playbook and use the Ansible `copy` module to copy the preconfigured file into place.

- Because we are connecting your webVM's to the ELK server, we need to edit the file to include your ELK server's IP address. 

  - Note that the default credentials are `elastic:changeme` and should not be changed at this step.

Scroll to line #1106 and replace the IP address with the IP address of your ELK machine.

```bash
output.elasticsearch:
hosts: ["10.1.0.4:9200"]
username: "elastic"
password: "changeme"
```

Scroll to line #1806 and replace the IP address with the IP address of your ELK machine.

```
setup.kibana:
host: "10.1.0.4:5601"
```
Save this file in  `/etc/ansible/files/filebeat-config.yml`.

After you have edited the file, your settings should resemble the below. Your IP address may be different, but all other settings should be the same, including ports.

 ```
 output.elasticsearch:
 hosts: ["10.1.0.4:9200"]
 username: "elastic"
 password: "changeme"
 ...

 setup.kibana:
 host: "10.1.0.4:5601"
 ```

#### 2. Create and run the Filebeat Installation Playbook file

  - Note that when text is copy and pasted from the web into your terminal, formatting differences are likely to occur that will corrupt this configuration file.
Create another Ansible playbook that accomplishes the Linux Filebeat installation instructions.

- The playbook tasks performed on the web servers:
  - Download the `.deb` file from [artifacts.elastic.co](https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.6.1-amd64.deb).
  - Install the `.deb` file using the `dpkg` command shown below:
    - `dpkg -i filebeat-7.6.1-amd64.deb`
  - Copy the Filebeat configuration file from your Ansible container to your WebVM's where you just installed Filebeat.
    - You can use the Ansible module `copy` to copy the entire configuration file into the correct place.
    - You will need to place the configuration file in a directory called `files` in your Ansible directory.
  - Run the `filebeat modules enable system` command.
  - Run the `filebeat setup` command.
  - Run the `service filebeat start` command.
  - Enable the Filebeat service on boot.

```bash
root@1f08425a2967:/etc/ansible# ansible-playbook filebeat-playbook.yml

PLAY [installing and launching filebeat] *******************************************************

TASK [Gathering Facts] *************************************************************************
ok: [10.0.0.4]
ok: [10.0.0.5]
ok: [10.0.0.6]


TASK [download filebeat deb] *******************************************************************
[WARNING]: Consider using the get_url or uri module rather than running 'curl'.  If you need to
use command because get_url or uri is insufficient you can add 'warn: false' to this command
task or set 'command_warnings=False' in ansible.cfg to get rid of this message.

changed: [10.0.0.4]
changed: [10.0.0.5]
changed: [10.0.0.6]

TASK [install filebeat deb] ********************************************************************
changed: [10.0.0.4]
changed: [10.0.0.5]
changed: [10.0.0.6]

TASK [drop in filebeat.yml] ********************************************************************
ok: [10.0.0.4]
ok: [10.0.0.5]
ok: [10.0.0.6]

TASK [enable and configure system module] ******************************************************
changed: [10.0.0.4]
changed: [10.0.0.5]
changed: [10.0.0.6]

TASK [setup filebeat] **************************************************************************
changed: [10.0.0.4]
changed: [10.0.0.5]
changed: [10.0.0.6]

TASK [start filebeat service] ******************************************************************
[WARNING]: Consider using the service module rather than running 'service'.  If you need to use
command because service is insufficient you can add 'warn: false' to this command task or set
'command_warnings=False' in ansible.cfg to get rid of this message.

changed: [10.0.0.4]
changed: [10.0.0.5]
changed: [10.0.0.6]

TASK [enable service filebeat on boot] **************************************************************************
changed: [10.0.0.4]
changed: [10.0.0.5]
changed: [10.0.0.6]

PLAY RECAP *************************************************************************************
10.0.0.4                  : ok=7    changed=6    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
10.0.0.5                  : ok=7    changed=6    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
10.0.0.6                   : ok=7    changed=6    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```
#### 6. Verifying Installation and Playbook 

Next, you needed to confirm that the ELK stack was receiving logs. Navigate back to the Filebeat installation page on the ELK server GUI.
- Verify that your playbook is running successfully.
- On the same page, scroll to **Step 5: Module status** and click **Check Data**.
- Scroll to the bottom and click on **Verify Incoming Data**.
- ELK stack was successfully receiving logs as seen in the following sceenshot:

![Filebeat Success Status](./images/filebeat_success.png)
![Metricbeat Success Status](./images/metricbeat_success.png)
### Bonus: Creating a Play to Install Metricbeat

To update your Ansible playbook to install Metricbeat:

From the homepage of your ELK site:
- Click **Add Metric Data**.
- Click **Docker Metrics**.
- Click the **DEB** tab under **Getting Started** for the correct Linux instructions.

- Download the [Metricbeat `.deb` file](https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-7.4.0-amd64.deb).

- Use `dpkg` to install the `.deb` file.
- Update and copy the provided [Metricbeat config file](https://gist.githubusercontent.com/slape/58541585cc1886d2e26cd8be557ce04c/raw/0ce2c7e744c54513616966affb5e9d96f5e12f73/metricbeat).
- Run the `metricbeat modules enable docker` command.
- Run the `metricbeat setup` command.
- Run the `metricbeat -e` command.
- Enable the Metricbeat service on boot.

To verify that your play works as expected, on the Metricbeat installation page in the ELK server GUI, scroll to **Step 5: Module Status** and click **Check Data**.