FROM amd64/haskell
RUN mkdir /root/.cabal
COPY config /root/.cabal
COPY config.yaml /root/.stack
RUN cabal update
RUN stack update
ENTRYPOINT /bin/bash 
