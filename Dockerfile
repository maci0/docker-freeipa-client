FROM maci/systemd
MAINTAINER Marcel Wysocki "maci.stgn@gmail.com"
ENV container docker

RUN rpm -Uvh "https://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm"
RUN cd /etc/yum.repos.d/; curl -O https://copr.fedoraproject.org/coprs/mkosek/freeipa/repo/epel-7/mkosek-freeipa-epel-7.repo
RUN yum -y install freeipa-client python-dbus
RUN yum clean all

ADD ipa-client-install.service /etc/systemd/system/ipa-client-install.service
ADD start.sh /start.sh

RUN systemctl enable ipa-client-install


VOLUME ["/sys/fs/cgroup"]
VOLUME ["/run"]

CMD  ["/usr/lib/systemd/systemd"]
