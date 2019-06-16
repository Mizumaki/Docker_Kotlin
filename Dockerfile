FROM ubuntu:18.04

# update package list => install core package => clean cache
RUN apt-get update \
  && apt-get install -y curl zip unzip sudo tar tzdata openssh-server openssh-client vim \
  && apt-get clean \
  && rm -fr /var/lib/apt/lists/* \
  && ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# install sdkman
RUN curl -s https://get.sdkman.io | bash
RUN /bin/bash -l -c "source /root/.sdkman/bin/sdkman-init.sh;sdk install java;sdk install kotlin;sdk install gradle"
WORKDIR /root
COPY src /root
CMD ["true"]