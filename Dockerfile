FROM ubuntu:latest

RUN /bin/bash -c 'HELLO'
ENV myEnvVar="Env Var 1" \
    otherEnvVar="Env Var 2"
