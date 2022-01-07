FROM jenkinsci/jnlp-slave
LABEL authors="vietanhs0817@gmail.com"

ENV DOCKER_VERSION=20.10.9
ENV TERRAFORM_VERSION=1.1.3

USER root
RUN apt-get update -qq && apt-get install -y -qq --no-install-recommends \
    make unzip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN curl -fsSLO https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}.tgz \
		&& tar --strip-components=1 -xvzf docker-${DOCKER_VERSION}.tgz -C /usr/local/bin \
		&& chmod -R +x /usr/local/bin/docker

RUN curl -fsSLO https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
		&& unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip  \
		&& mv terraform /usr/local/bin/ \
		&& chmod -R +x /usr/local/bin/terraform

RUN terraform version
