FROM debian:8

COPY check /opt/resource/check
COPY in /opt/resource/in
COPY out /opt/resource/out
COPY run.sh /opt/resource/run.sh
COPY test.sh /opt/resource/test.sh
COPY .flow_token /opt/resource/.flow_token
COPY .thread_id /opt/resource/.thread_id

RUN apt-get update
RUN apt-get install -y curl jq
RUN chmod +x /opt/resource/check /opt/resource/in /opt/resource/out /opt/resource/run.sh /opt/resource/test.sh && \
  chmod +rw /opt/resource/.flow_token /opt/resource/.thread_id
