FROM ubuntu:latest

# setting up requiered sowftware
RUN apt-get -qq update
RUN apt-get install -y -qq git && \
    apt-get install -y -qq make && \
    apt-get install -y -qq vim && \
    apt-get install -y -qq golang-go > /dev/null
RUN git clone https://github.com/jpmorganchase/quorum.git
RUN cd /quorum && make all
RUN cp -r /quorum/build/bin/. /usr/local/bin

ENTRYPOINT ["geth""]