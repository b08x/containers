#
# Dockerfile for OpenRefine with RDF Extension
#

FROM openjdk:8-jre-alpine
MAINTAINER thadguidry@gmail.com

ENV OPENREFINE_MEMORY 2G
ENV OPENREFINE_VERSION 3.4.1
ENV OPENREFINE_FILE openrefine-linux-${OPENREFINE_VERSION}.tar.gz
ENV OPENREFINE_URL https://github.com/OpenRefine/OpenRefine/releases/download/${OPENREFINE_VERSION}/${OPENREFINE_FILE}
ENV RDF_EXTENSION_VERSION 1.3.0
ENV RDF_EXTENSION_FILE rdf-extension-${RDF_EXTENSION_VERSION}.zip
ENV RDF_EXTENSION_URL https://github.com/stkenny/grefine-rdf-extension/releases/download/v${RDF_EXTENSION_VERSION}/${RDF_EXTENSION_FILE}

WORKDIR /app

RUN set -xe \
    && apk add --no-cache bash curl tar \
    && curl -sSL ${OPENREFINE_URL} | tar xz --strip 1 \
    && cd webapp/extensions && mkdir rdf-extension \
    && curl -o rdf-extension.zip -ssL ${RDF_EXTENSION_URL} \
    && unzip -d rdf-extension rdf-extension.zip && rm rdf-extension.zip

VOLUME /data
WORKDIR /data

EXPOSE 3333

#ENTRYPOINT ["/app/refine"]
CMD ["sh", "-c", "/app/refine -i 0.0.0.0 -d /data -m ${OPENREFINE_MEMORY}" ]