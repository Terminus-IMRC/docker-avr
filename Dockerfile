FROM debian

RUN apt-get update \
 && apt-get upgrade -y \
 && apt-get install -y sudo make python python-pip htop tmux less \
                       gcc-avr avrdude arduino picocom \
 && apt-get clean \
 && pip2 install ino

RUN useradd imrc -m -b /home \
 && echo 'imrc:imrc' | chpasswd \
 && echo 'imrc ALL = NOPASSWD : ALL' >>/etc/sudoers.d/imrc \
 && chown imrc.imrc -R /home/imrc

USER imrc
WORKDIR /home/imrc

CMD /bin/bash
