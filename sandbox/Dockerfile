FROM debian:10.10

COPY Makefile /tmp/Makefile
COPY vim /tmp/vim/

RUN apt update && apt install -y make
WORKDIR /tmp 
RUN make build

