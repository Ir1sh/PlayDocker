#we are going to use ansible for as much provisioning as possible so use ansible ubuntu base image
FROM ir1sh/dockeractivator
MAINTAINER Mark Moore

#Add playbooks to the docker image
ADD ansible /srv/ansible/
WORKDIR /srv/ansible

#run ansible to configure the docker image
RUN ansible-playbook play.yml -c local

#Change user, launch bash
USER play
WORKDIR /home/play
CMD ["/bin/bash"]

#expose Code volume and play ports 9000 default 9999 debug 8888 activator ui
VOLUME "/home/play/Code"
EXPOSE 9000
EXPOSE 9999
EXPOSE 8888
WORKDIR /home/play/Code
