#INSTALL git, build-essential, cmake
Install_pkg:
  pkg.installed:
    - pkgs:
      - git
      - build-essential
      - cmake

#CREATE USER
teamspeak:
  user.present:
    - empty_password: True

Box86:
  git.cloned:
    - name: 'https://github.com/ptitSeb/box86.git'
    - target: /home/teamspeak/box86
   #- version:

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
  pkg.installed:
    - onchanges:
      - cmd: Extra_steps_for_64bit  

All_packages:
  cmd.run:
   - name: 'sudo apt install libc6:armhf libncurses5:armhf libstdc++6:armhf -y'
   - onchanges:
     - pkg: gcc-arm-linux-gnueabihf

#BOX86 manual INSTALL
#git clone --branch "v0.2.2" https://github.com/ptitSeb/box86
#sudo dpkg --add-architecture armhf
#sudo apt update
#sudo apt install gcc-arm-linux-gnueabihf libc6:armhf libncurses5:armhf libstdc++6:armhf
#cd ~/box86
#mkdir build
#cd build
#cmake .. -DRPI4ARM64=1 -DCMAKE_BUILD_TYPE=RelWithDebInfo
#make -j$(nproc)
#sudo make install
#sudo systemctl restart systemd-binfmt




#Generate_makefile:
#  cmd.run:
#    - name: 'cmake .. -DRPI4ARM64=1 -DCMAKE_BUILD_TYPE=RelWithDebInfo'
#    - cwd: /home/teamspeak/box86/build

