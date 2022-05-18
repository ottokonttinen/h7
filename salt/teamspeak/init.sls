Install_pkg:
  pkg.installed:
    - pkgs:
      - git
      - build-essential
      - cmake

teamspeak:
  user.present

Box86:
  git.cloned:
    - name: 'https://github.com/ptitSeb/box86.git'
    - target: /home/teamspeak/box86

/home/teamspeak/box86/build:
  file.directory:
    - makedirs: True
    - user: teamspeak
    - group: teamspeak
    
Extra_steps_for_64bit:
  cmd.run:
    - name: 'sudo dpkg --add-architecture armhf;sudo apt update'
    - creates: '/usr/bin/arm-linux-gnueabihf-pkg-config'

gcc-arm-linux-gnueabihf:
  pkg.installed  

All_packages:
  cmd.run:
   - name: 'sudo apt install libc6:armhf libncurses5:armhf libstdc++6:armhf -y'
   - onchanges:
     - pkg: gcc-arm-linux-gnueabihf

Generate_makefile:
  cmd.run:
   - name: 'cmake .. -DRPI4ARM64=1 -DCMAKE_BUILD_TYPE=RelWithDebInfo'
   - cwd: /home/teamspeak/box86/build
   - creates: '/home/teamspeak/box86/build/system'
      
Compile:
  cmd.run:
    - name: 'make -j$(nproc)'
    - cwd: /home/teamspeak/box86/build     
    - creates:
      - /home/teamspeak/box86/build/box86
      - /home/teamspeak/box86/build/libdynarec.a      
      
Install:
  cmd.run:
    - name: 'sudo make install'
    - cwd: /home/teamspeak/box86/build
    - creates: /home/teamspeak/box86/build/install_manifest.txt    
    
systemd-binfmt:
  service.running:
    - enable: True
    - reload: True
    - watch:
      - cmd: Install   

extract_teamspeak3:
  archive.extracted:
    - name: /home/teamspeak/
    - source: https://files.teamspeak-services.com/releases/server/3.13.6/teamspeak3-server_linux_x86-3.13.6.tar.bz2
    - source_hash: f142a215e76feb0e5b9aa36fa37017c109d444ec1b66753465387d575ef39b14
    - user: teamspeak
    - group: teamspeak
    
/home/teamspeak/teamspeak3-server_linux_x86/.ts3server_license_accepted:
  file.managed
  
/etc/systemd/system/teamspeak3.service:
  file.managed:
   - contents:
     - '[Unit]'
     - 'Description=TeamSpeak 3 Server'
     - 'After=network.target'
     - ' '
     - '[Service]'
     - 'User=root'
     - 'WorkingDirectory=/home/teamspeak/teamspeak3-server_linux_x86/'
     - 'ExecStart=/home/teamspeak/teamspeak3-server_linux_x86/ts3server'
     - 'Restart=alway'
     - ' '
     - '[Install]'
     - 'WantedBy=multi-user.target'

teamspeak3.service:
  service.enabled  
