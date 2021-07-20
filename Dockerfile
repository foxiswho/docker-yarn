
FROM node:lts-alpine

MAINTAINER foxiswho@gmail.com

ARG port

#ip
ENV PORT ${port:-4000}

# home
ENV PROGRAM_HOME  /root
ENV PROGRAM_APP  /root/app


RUN rm -rf /etc/localtime \
&& ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
&& echo "Asia/Shanghai" > /etc/localtime \
&& mkdir -p ${PROGRAM_APP} \
&& curl -o- -L https://yarnpkg.com/install.sh | bash

RUN $HOME/.yarn/bin/yarn install

USER root

RUN npm install -g webpack && npm install && yarn febuild

VOLUME ${PROGRAM_APP}
WORKDIR  ${PROGRAM_APP}


EXPOSE ${PORT}


CMD ["yarn","bestart"]


