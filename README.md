### Automated 

The automated install use systemd timer or cron and bashrc.  
To install this, with root rights:

* Clone the repo
* Install: `./install -u <user>`
* Configure layout: `vim ./config`
* Configure widgets: `vim ./widgets/<widget-name>`
* Run interactively: `./generate`

The script runs:
* every hour for system information (cpu, disks, ...)
* every day for other information (certificates, packages, ...)

### Manual

To install manually, with root rights:

* Clone the repo
* Configure layout: `vim ./config`
* Configure widgets: `vim ./widgets/<widget-name>`
* Run interactively: `./generate`
* Generate a static motd file: `./generate > ./data/motd`
* Use the jobs scheduler of your choice to regenerate motd (for instance systemd timer or cron) 
* Add a print of your motd file at login (for instance in `~/.bashrc`) 

