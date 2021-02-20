FROM alpine:latest

RUN apk update && \
    apk upgrade && \
    apk add git

RUN mkdir bundle && mkdir devops
COPY test.zip bundle 
COPY pushbundle.sh devops

RUN chmod +x devops/pushbundle.sh

RUN git config --global init.defaultBranch main \
    && git config --global user.name "<User name>" \
    && git config --global user.email "<User email>" 

WORKDIR /bundle
RUN unzip test.zip -j
RUN rm test.zip
RUN git init 
RUN git add -A
RUN git commit -m"Initial Commit"

WORKDIR /
ENTRYPOINT [ "sh", "/devops/pushbundle.sh" ]

