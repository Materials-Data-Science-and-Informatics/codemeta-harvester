FROM alpine:latest
RUN apk add python3 py3-pip py3-yaml py3-ruamel.yaml py3-requests py3-matplotlib py3-markdown py3-rdflib py3-lxml git dasel curl

#pandoc is not in stable yet, grab from edge/testing:
RUN apk add --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing/ pandoc

#TODO: replace with stable version after codemetapy release --------------v
RUN python3 -m pip install  --no-cache-dir --prefix /usr git+https://github.com/proycon/codemetapy.git cffconvert
COPY codemeta-harvester /usr/bin/
ENTRYPOINT ["codemeta-harvester"]
