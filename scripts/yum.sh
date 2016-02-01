#!/bin/bash

#load proxy if file exist
[ -f /root/proxy.env ] && source /root/proxy.env

#ntp 
chkconfig ntpd on
service ntpd status && service ntpd start || service ntpd restart
service ntpd status && service ntpd start || service ntpd restart

#update public-yum if there is internet
curl -sSL http://public-yum.oracle.com/public-yum-ol6.repo -o /etc/yum.repos.d/public-yum-ol6.repo.new                                       
if [ $? -eq 0 ]; then                                                                                                                   
  mv /etc/yum.repos.d/public-yum-ol6.repo /etc/yum.repos.d/public-yum-ol6.repo.old                                                      
  mv /etc/yum.repos.d/public-yum-ol6.repo.new /etc/yum.repos.d/public-yum-ol6.repo                                                      
fi

#enable additional repos
yum-config-manager --enable ol6_UEKR4
yum-config-manager --enable ol6_addons                                                                                                
yum-config-manager --enable ol6_latest                                                                                                
yum-config-manager --enable ol6_software_collections

#update and install base packages
yum update -y
#yum install -y iscsi-initiator-utils lvm2 ocfs2-tools btrfs-progs reflink mc tree wget curl iotop telnet mysql git glibc-static

#configure epel
yum localinstall -y http://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm
#yum install -y tmux htop
yum-config-manager --disable epel

#jq
#curl -sSL -sSL https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64 -o /usr/local/bin/jq
#chmod +x /usr/local/bin/jq
