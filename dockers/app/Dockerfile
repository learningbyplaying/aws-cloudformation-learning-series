FROM ubuntu:18.04

RUN apt-get clean && apt-get -y update && apt-get install -y locales curl software-properties-common git \
  && locale-gen en_US.UTF-8
RUN apt-get install unzip -y
RUN apt-get install nano -y
RUN apt-get install htop -y
RUN apt-get install wget -y
RUN apt-get install curl -y
RUN apt-get install sshpass -y
RUN apt-get install ftp -y

RUN apt-get update && \
    apt-get install python -y

WORKDIR /app

#RUN apt-get update  && apt-get install python-pip -y

RUN apt-get update && apt-get install python3-pip -y

RUN pip3 install -U python-dotenv
RUN pip3 install --upgrade pip
RUN pip3 install requests
RUN pip3 install awscli
RUN pip3 install boto3
RUN pip3 install oauth2client==3.0.0

ENV LC_CTYPE en_US.UTF-8
ENV LANG en_US.UTF-8
