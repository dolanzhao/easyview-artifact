FROM ubuntu:latest
RUN apt-get update && apt-get install -y sudo openssh-server git python3-pip python3-dev build-essential git-lfs gcc-9
RUN mkdir /var/run/sshd
RUN useradd -m qzhao24 && echo "qzhao24:1234" | chpasswd
RUN adduser qzhao24 sudo
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config
RUN chsh -s /bin/bash qzhao24
USER qzhao24
RUN mkdir /tmp/easyview
RUN cd /home/qzhao24 && git clone https://github.com/dolanzhao/easyview-artifact.git && cd easyview-artifact && git lfs fetch && git lfs pull && ./init.sh
USER root
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]