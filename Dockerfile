FROM debian:stable

MAINTAINER "bung@slac.stanford.edu"

ENV DEBIAN_FRONTEND noninteractive

# imagemagick and elog
RUN apt-get update \
    && apt-get --yes install \
        vim-tiny \
        imagemagick \
        ckeditor \
        elog \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get clean

# elog config
RUN mkdir /etc/elog
#COPY ./elog.conf /etc/elog/elog.conf
#RUN chown elog:elog /etc/elog/elog.conf

# CSS banner themes
RUN mkdir /usr/share/elog/themes/default/banner
#COPY ./elog-banner-css/css/ /usr/share/elog/themes/default/banner

# elog logbooks
# RUN chown -R elog:elog /var/lib/elog

EXPOSE 8080

USER exouser:exouser
CMD ["elogd", "-p", "8080", "-c", "/etc/elog/elog.conf"]
