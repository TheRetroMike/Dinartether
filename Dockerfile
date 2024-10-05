FROM ubuntu:jammy
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y
RUN apt-get install wget unzip libssl-dev libdb++-dev libboost-all-dev build-essential pkg-config bsdmainutils libminiupnpc-dev libnatpmp-dev libzmq3-dev systemtap-sdt-dev -y
RUN git clone clone https://github.com/TheRetroMike/Dinartether.git
RUN cd Dinartether
RUN chmod +x autogen.sh
RUN ./autogen.sh
RUN ./configure --with-incompatible-bdb
RUN make
RUN mv dinartetherd /usr/bin/dinartetherd
CMD ["/usr/bin/dinartetherd", "--printtoconsole"]
