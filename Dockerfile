FROM amazonlinux:2

RUN amazon-linux-extras install -y
RUN amazon-linux-extras install -y epel

RUN yum update -y && \
    yum install -y systemd systemd-sysv tar unzip sudo which shadow-utils procps wget

# m1 mac
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "awscliv2.zip"
# intel mac
# RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN sudo ./aws/install
RUN rm awscliv2.zip

RUN useradd "ec2-user" && echo "ec2-user ALL=NOPASSWD: ALL" >> /etc/sudoers

CMD ["/sbin/init"]
