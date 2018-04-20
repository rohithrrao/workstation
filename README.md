Ansible playbook and Vagrantfile for recreating workstation.  Testing with VirtualBox 5.2 and Vagrant 2.0.1

Includes:
- Xfce desktop
- Java
- Vim
- Eclipse
- Meld
- Git
- Docker

# Prerequisites
- Install [VirtualBox](https://www.virtualbox.org)
- Install [Vagrant](https://www.vagrantup.com)
- Install [vagrant-vbguest](https://github.com/dotless-de/vagrant-vbguest) plugin

# Personalizing
Before using the box, copy ```personalize.yml.example``` to ```personalize.yml``` and edit the file with your information.

# First Run
On first run, the box must be provisioned and then reloaded.
```
vagrant up
...wait for provisioning to complete...
vagrant reload
```

# Access
Once the box is provisioned and reloaded, it can be accessed via SSH or the GUI.  

## SSH
To access via SSH either use ```vagrant ssh``` or use ```vagrant ssh-config``` to generate a config for use in an SSH client.
Using ```vagrant ssh``` will connect as the ```vagrant``` user.  If a config is generated, the user can be replaced with 
the ```local_username``` used in ```personalize.yml```

## GUI
To access the GUI, a password will need to be created.  Connect as ```local_username``` and set a password using ```passwd``` command.  
The password can then be used to login to the GUI. 

# New Roles
Adding new generic roles can be done by creating a new role in the ```roles/``` directory and updating ```playbool.yml```

# Customize
To customize the workstation in a non-generic way, add to the ```custom/``` directory.

