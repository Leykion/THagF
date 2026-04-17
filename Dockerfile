FROM debian:stable-slim

WORKDIR /app

RUN apt-get update && apt-get install -y \
    curl \
    procps \
    uuid-runtime \
    openssl \
    ca-certificates \
    wget \
    bash \
    && rm -rf /var/lib/apt/lists/*

ADD https://raw.githubusercontent.com/yonggekkk/argosbx/main/argosbx.sh /app/argosbx.sh
RUN chmod +x /app/argosbx.sh

ENV PORT=3000
ENV vlpt=""
ENV vmpt="13940"
ENV vwpt=""
ENV uuid="7fca4646-881b-4b9f-9c00-acecbeea7b96"
ENV argo="vmpt"

#EXPOSE 3000

ENTRYPOINT ["/bin/bash", "-c", "vlpt=${vlpt} vmpt=${vmpt} vwpt=${vwpt} uuid=${uuid} argo=${argo} /app/argosbx.sh"]
