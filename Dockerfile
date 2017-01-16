FROM ruby:2.4-alpine

# Update all
RUN  apk update

ENV BUILD_PACKAGES='build-base sqlite-dev'
ENV DEPS='sqlite'

RUN apk --update --upgrade add $BUILD_PACKAGES $DEPS

RUN gem install mailcatcher

RUN rm -rf /tmp/* /var/tmp/*

# SMTP port
EXPOSE 1025

# Webserver port
EXPOSE 1080

CMD ["mailcatcher", "-f", "--ip=0.0.0.0"]
