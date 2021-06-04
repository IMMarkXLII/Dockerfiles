#The base image is an ubuntu/debian image
FROM gradle:7.0.2-jdk11

# the following will clean and update the apt-get packaging tool/manager
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get autoremove -y
RUN apt-get autoclean -y

# the following lines will install pyton3.8 and aws-cli2
RUN apt-get install software-properties-common -y
RUN add-apt-repository ppa:deadsnakes/ppa -y
RUN apt-get install -y python3.8
RUN curl -sL https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip -o awscliv2.zip \
    && unzip awscliv2.zip \
        && aws/install || aws/install --update \
        && rm -rf \
            awscliv2.zip \
            aws \
            /usr/local/aws-cli/v2/*/dist/aws_completer \
            /usr/local/aws-cli/v2/*/dist/awscli/data/ac.index \
            /usr/local/aws-cli/v2/*/dist/awscli/examples

RUN aws --version
RUN python3 --version
