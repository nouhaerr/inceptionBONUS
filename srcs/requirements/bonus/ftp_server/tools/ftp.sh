#!/bin/sh

if [ ! -f "/etc/vsftpd.conf.def" ]; then

    mkdir -p /var/www/html

    cp /etc/vsftpd.conf /etc/vsftpd.conf.def
    mv /tmp/vsftpd.conf /etc/vsftpd.conf

    # Add the FTP_USER, change his password and declare him as the owner of wordpress folder and all subfolders
    adduser $FTP_USR --disabled-password
    echo "$FTP_USR:$FTP_PWD" | /usr/sbin/chpasswd &> /dev/null
    chown -R $FTP_USR:$FTP_USR /var/www/html

	#chmod +x /etc/vsftpd/vsftpd.conf
    echo $FTP_USR | tee -a /etc/vsftpd.userlist &> /dev/null

fi

echo "FTP started on :21"
/usr/sbin/vsftpd /etc/vsftpd.conf