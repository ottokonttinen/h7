#Installation manually:
#wget https://files.teamspeak-services.com/releases/server/3.13.6/teamspeak3-server_linux_amd64-3.13.6.tar.bz2
#tar -xvpf teamspeak3-server_linux_amd64-3.13.6.tar.bz2
#cd teamspeak3-server_linux_amd64
#touch .ts3server_license_accepted
#./ts3server

#Downloads the installation file. (option1)
#download_teamspeak3:
#  file.managed:
#    - name: /home/teamspeak/teamspeak3-server_linux_amd64-3.13.6.tar.bz2
#    - source: https://files.teamspeak-services.com/releases/server/3.13.6/teamspeak3-server_linux_amd64-3.13.6.tar.bz2
#    - source_hash: 53704d27826385ddfd803ee232c1d3f021ad9bf18540313691841ad9bb722bec

#Downloads AND extracts the installation file. (option2, probably better)
extract_teamspeak3:
  archive.extracted:
    - name: /home/teamspeak/teamspeak3-server_linux_amd64-3.13.6.tar.bz2
    - source: https://files.teamspeak-services.com/releases/server/3.13.6/teamspeak3-server_linux_amd64-3.13.6.tar.bz2
    - source_hash: 53704d27826385ddfd803ee232c1d3f021ad9bf18540313691841ad9bb722bec
    - user: teamspeak
    - group: teamspeak
    - if_missing: /home/teamspeak/teamspeak3-server_linux_amd64
