FROM ruby:2.5.3

WORKDIR /app

ENV GEM_HOME /rubygems
ENV BUNDLE_PATH /rubygems

ADD . /app