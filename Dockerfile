FROM elixir:1.9

ARG uid
ARG path=/aoc

RUN adduser -u $uid aoc

USER $uid
WORKDIR $path

CMD /usr/bin/env bash
