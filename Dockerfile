
FROM alpine:edge

MAINTAINER foxiswho@gmail.com

ARG port

#ip
ENV PORT ${port:-4000}

# home
ENV PROGRAM_HOME  /root
ENV PROGRAM_APP  /root/app


RUN rm -rf /etc/localtime \
&& ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
#&& echo "Asia/Shanghai" > /etc/localtime \
&& mkdir -p ${PROGRAM_APP} \
##&& mkdir -p $HOME/.yarn \
#&& curl -o- -L https://yarnpkg.com/install.sh | sh \
&& echo "https://mirror.tuna.tsinghua.edu.cn/alpine/edge/testing" >> /etc/apk/repositories \
&& apk update  \
&& apk add --no-cache nodejs npm yarn git vim \
#&& apk add --no-cache yarn \
&& which yarn \
##&& rm -rf /var/cache/apk/* /tmp/* \
&& ls -lh  $HOME \
#&& ls -lh  $HOME/.yarn
&& chmod -R 777 ${PROGRAM_APP} \
&& rm -rf /var/cache/apk/* /tmp/*

#RUN $HOME/.yarn/bin/yarn install

USER root

RUN npm install -g webpack && yarn

VOLUME ${PROGRAM_APP}
WORKDIR  ${PROGRAM_APP}


EXPOSE ${PORT}


CMD ["yarn","bestart"]


