FROM debian:8.1

RUN dpkg --add-architecture i386 && \
	apt-get update && \
	apt-get upgrade -y && \	
	apt-get install wget libbz2-1.0:i386 libxt6:i386 libc6:i386 libfontconfig1:i386 libfreetype6:i386 libgcc1:i386 libice6:i386 libsm6:i386 libstdc++6:i386 libx11-6:i386 libxcursor1:i386 libxext6:i386 libxft2:i386 libxi6:i386 libxinerama1:i386 libxrandr2:i386 libxrender1:i386 zlib1g:i386 fontconfig:i386 -y && \
	mkdir -p /opt/beyond_compare_4/ && \
	wget http://www.scootersoftware.com/bcompare-4.0.7.19761_i386.deb -O /opt/beyond_compare_4/bcompare.deb

RUN	dpkg -i /opt/beyond_compare_4/bcompare.deb

# Replace 1000 with your user / group id
RUN export uid=1000 gid=1000 && \
    mkdir -p /home/developer && \
    mkdir -p /etc/sudoers.d/ && \
    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:${uid}:" >> /etc/group && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
    chmod 0440 /etc/sudoers.d/developer && \
    chown ${uid}:${gid} -R /home/developer

VOLUME /media/milan/work/

USER developer
ENV HOME /home/developer
CMD /usr/bin/bcompare
