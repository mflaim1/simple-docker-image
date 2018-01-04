FROM ubuntu:latest

CMD ["/bin/echo", "hello world"]
ENV myEnvVar="Env Var 1" \
    otherEnvVar="Env Var 2"
