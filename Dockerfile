FROM amazonlinux:2

RUN amazon-linux-extras install -y

RUN yum update -y \
    && yum install -y systemd tar unzip sudo

# m1 mac
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN sudo ./aws/install

# intel mac
# RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
# RUN unzip awscliv2.zip
# RUN sudo ./aws/install

RUN useradd "ec2-user" && echo "ec2-user ALL=NOPASSWD: ALL" >> /etc/sudoers

CMD ["/sbin/init"]
