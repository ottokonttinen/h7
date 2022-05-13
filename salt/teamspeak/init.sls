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



#BOX64 INSTALL
#git clone https://github.com/ptitSeb/box64
#cd box64
#mkdir build; cd build; cmake .. -DRPI4ARM64=1 -DCMAKE_BUILD_TYPE=RelWithDebInfo
#make -j4
#sudo make install
#sudo systemctl restart systemd-binfmt

/home/teamspeak/box64/build:
  file.directory:
    - makedirs: True
    - user: teamspeak
    - group: teamspeak
