# Install Teamspeak3 server with salt 
Project Goal: Installing TeamSpeak 3 VoiP server for Raspberry Pi or other Linux machines using SaltStack configuration management tools. \
This project is part of a configuration management course ICT4TN022-3015 at Haaga-Helia UAS. 

\
Creator: Otto Konttinen \
Current stage: Alpha \
Download: [https://github.com/ottokonttinen/h7.git](https://github.com/ottokonttinen/h7.git) \
Requirements: 
+  64bit Linux OS
+  [Salt-master](https://repo.saltproject.io/) 

![](https://ottokonttinen.files.wordpress.com/2022/05/nayttokuva-2022-05-17-033248.png) 

## Installation
`git clone https://github.com/ottokonttinen/h7.git` Download from Git. \
`mv ~/h7/salt/ /srv/` Move salt folder to /srv/ directory. \
`sudo apt install salt-master` Install salt-master. \
`sudo salt-call --local state.apply -l debug 'ts3'` Run salt locally to install TeamSpeak. \
Run module `teamspeak` for Raspberry Pi and `ts3` for AMD64 machines.
