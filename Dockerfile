FROM ubuntu:18.04

MAINTAINER kevin <xckevin927@gmail.com>

# prepare env
RUN dpkg --add-architecture i386
RUN apt update
RUN apt install -y \
        build-essential git wget unzip sudo \
        libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386 \
        libxrender1 libxtst6 libxi6 libfreetype6 libxft2 \
        qemu qemu-kvm libvirt-bin ubuntu-vm-builder bridge-utils libnotify4 libglu1 libqt5widgets5 openjdk-11-jdk xvfb
RUN apt install -y usbutils android-tools-adb
RUN apt clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# prepare user
ARG USER=android
RUN mkdir -p /home/$USER

RUN groupadd -g 1000 -r $USER
RUN useradd -u 1000 -g 1000 --create-home -r $USER
RUN adduser $USER libvirt
RUN adduser $USER kvm
#Change password
RUN echo "$USER:$USER" | chpasswd
#Make sudo passwordless
RUN echo "${USER} ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/90-$USER
RUN usermod -aG sudo $USER
RUN usermod -aG plugdev $USER


# get android stuido
WORKDIR /home/$USER

RUN wget https://r2---sn-bvn0o-fo1l.gvt1.com/edgedl/android/studio/ide-zips/2021.1.1.22/android-studio-2021.1.1.22-linux.tar.gz -O android-studio.tar.gz
RUN tar zxvf android-studio.tar.gz
RUN rm -rf ./android-studio.tar.gz

CMD ["./android-studio/bin/studio.sh"]
