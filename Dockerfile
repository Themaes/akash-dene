FROM ubuntu:22.04

# Install dependencies
RUN apt-get update && apt-get install -y \
    wget \
    xz-utils \
    libcurl4 \
    && rm -rf /var/lib/apt/lists/*

# Set SRBMiner version to the latest (3.2.2 as of March 2026)
ENV SRB_VERSION=3.2.2
WORKDIR /miner

# Download and extract SRBMiner (Updated link format)
RUN wget https://github.com/doktor83/SRBMiner-Multi/releases/download/${SRB_VERSION}/SRBMiner-Multi-$(echo $SRB_VERSION | tr . -)-Linux.tar.xz \
    && tar -xvf SRBMiner-Multi-$(echo $SRB_VERSION | tr . -)-Linux.tar.xz --strip-components=1 \
    && rm SRBMiner-Multi-$(echo $SRB_VERSION | tr . -)-Linux.tar.xz

RUN chmod +x SRBMiner-MULTI

ENTRYPOINT ["./SRBMiner-MULTI"]
