

#create service file 
/etc/systemd/system/teamspeak3.service:
  file.managed:
   - contents:
     - '[Unit]'
     - 'Description=TeamSpeak 3 Server'
     - 'After=network.target'
     - ' '
     - '[Service]'
     - 'User=otto'
     - 'WorkingDirectory=/home/teamspeak/teamspeak3-server_linux_x86/'
     - 'ExecStart=/home/teamspeak/teamspeak3-server_linux_x86/ts3server'
     - 'Restart=on-failure'
     - ' '
     - '[Install]'
     - 'WantedBy=multi-user.target'

teamspeak3.service:
  service.enabled
