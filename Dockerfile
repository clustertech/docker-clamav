FROM centos:7
ENV container docker
RUN curl -Lo /tini https://github.com/krallin/tini/releases/download/v0.18.0/tini-amd64; \
chmod 755 /tini
RUN yum -y update; \
yum install -y epel-release rsyslog; \
yum install -y clamd; \
yum clean all; \
sed -i 's/^Example/#Example/' /etc/clamd.d/scan.conf; \
sed -i 's/^#LocalSocket \(.*\)/LocalSocket \1/' /etc/clamd.d/scan.conf; \
sed -i 's/#NotifyClamd.*/NotifyClamd \/run\/clamd.scan\/clamd.sock/' /etc/freshclam.conf
COPY . /
ENTRYPOINT ["/tini", "/startclamav.sh"]
