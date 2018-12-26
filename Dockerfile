FROM cloudprober/cloudprober:v0.10.0

ENV PORT 8080
ENV CLOUDPROBER_PORT $PORT
EXPOSE $PORT

COPY ./probe.cfg /etc/cloudprober.cfg
