
if [ -f setup.flag ]; then
	adduser $FTP_USER -D
	yes $FTP_PASSWORD | passwd $FTP_USER > /dev/null
fi

exec vsftpd /etc/vsftpd/vsftpd.conf