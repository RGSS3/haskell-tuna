FROM amd64/haskell
RUN mkdir /root/.cabal
COPY config /root/.cabal
COPY config.yaml /root/.stack
RUN cabal update
RUN stack update
RUN cabal install regex-posix
RUN cabal install http-conduit
RUN cabal install sqlite-simple
RUN cabal install bytestring
RUN cabal install lens
COPY sources.list /etc/apt
RUN sudo apt update
RUN sudo apt install cmake -y
ENTRYPOINT /bin/bash