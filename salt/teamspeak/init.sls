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



#BOX86 INSTALL
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

/home/teamspeak/box86/build:
  file.directory:
    - makedirs: True
    - user: teamspeak
    - group: teamspeak
