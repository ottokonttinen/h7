teamspeak:
  user.present:
    - empty_password: True

extract_teamspeak3:
  archive.extracted:
    - name: /home/teamspeak/
    - source: https://files.teamspeak-services.com/releases/server/3.13.6/teamspeak3-server_linux_amd64-3.13.6.tar.bz2
    - source_hash: 53704d27826385ddfd803ee232c1d3f021ad9bf18540313691841ad9bb722bec
    - user: teamspeak
    - group: teamspeak
    - if_missing: /home/teamspeak/teamspeak3-server_linux_amd64
      
/home/teamspeak/teamspeak3-server_linux_amd64/.ts3server_license_accepted:
  file.managed

/etc/systemd/system/teamspeak3.service:
  file.managed:
   - contents:
     - '[Unit]'
     - 'Description=TeamSpeak 3 Server'
     - 'After=network.target'
     - ' '
     - '[Service]'
     - 'User=teamspeak'
     - 'WorkingDirectory=/home/teamspeak/teamspeak3-server_linux_amd64/'
     - 'ExecStart=/home/teamspeak/teamspeak3-server_linux_amd64/ts3server'
     - 'Restart=on-failure'
     - ' '
     - '[Install]'
     - 'WantedBy=multi-user.target'

teamspeak3.service:
  service.enabled
