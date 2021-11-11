apt install vsftpd ftp



## Create ftp user james
adduser james
passwd james


## Copy configurations to /etc/vsftpd
cp /etc/vsftpd.conf /etc/vsftpd.conf.bak
cp vsftpd-ubuntu.conf /etc/vsftpd.conf
cp vsftpd.userlist  /etc/vsftpd.userlist
# secure_chroot_dir
mkdir -p /home/vsftpd/empty
mkdir -p /home/james/ftp/ftp_shared


# restart vsftpd
systemctl enable vsftpd
systemctl restart vsftpd
systemctl status vsftpd


ip address

# log in to your localhost
# you may want to replace the localhost text by your network IP
ftp localhost


# Now the SELinux is in permissive mode and you can run
ftp localhost
# SELinux will still log the error messages and we can fix it.

# SE troubleshoot will show some error messages
# You can use journalctl
journalctl --since "5 minutes  ago"

# journal control will show you some suggestion to repair things



### Configuring firewall
##You need to add the port and service to firewall
# To add port 20
firewall-cmd --zone=public --add-port=20/tcp
firewall-cmd --add-service=ftp

firewall-cmd --permanent --zone=public --add-port=20/tcp
firewall-cmd ---permanent -add-service=ftp
firewall-cmd --list-all

#If you want it to be permanent then add "--permanent" to first two command






