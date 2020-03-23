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
RUN rm /etc/apt/source.list.d/ghc.list
RUN apt update
RUN apt install cmake ssh astyle -y
ENTRYPOINT /bin/bash
