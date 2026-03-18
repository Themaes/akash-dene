FROM ubuntu:22.04

# Install dependencies
RUN apt-get update && apt-get install -y \
    wget \
    xz-utils \
    libcurl4 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /miner

# Use the exact link you provided
RUN wget https://github.com/doktor83/SRBMiner-Multi/releases/download/3.2.2/SRBMiner-Multi-3-2-2-Linux.tar.gz \
    && tar -xzvf SRBMiner-Multi-3-2-2-Linux.tar.gz --strip-components=1 \
    && rm SRBMiner-Multi-3-2-2-Linux.tar.gz

RUN chmod +x SRBMiner-MULTI

ENTRYPOINT ["./SRBMiner-MULTI"]
