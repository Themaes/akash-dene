FROM ubuntu:22.04
RUN apt-get update && apt-get install -y wget xz-utils libcurl4 && rm -rf /var/lib/apt/lists/*
ENV SRB_VERSION=2.6.9
WORKDIR /miner
RUN wget https://github.com/doktor83/SRBMiner-Multi/releases/download/${SRB_VERSION}/SRBMiner-Multi-$(echo $SRB_VERSION | tr . -)-Linux.tar.xz \
    && tar -xvf SRBMiner-Multi-$(echo $SRB_VERSION | tr . -)-Linux.tar.xz --strip-components=1 \
    && rm SRBMiner-Multi-$(echo $SRB_VERSION | tr . -)-Linux.tar.xz
RUN chmod +x SRBMiner-MULTI
ENTRYPOINT ["./SRBMiner-MULTI"]
