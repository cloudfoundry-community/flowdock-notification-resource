FROM debian:8

ADD http://stedolan.github.io/jq/download/linux64/jq /usr/local/bin/jq

COPY check /opt/resource/check
COPY /in /opt/resource/in
COPY /out /opt/resource/out
COPY run.sh /opt/resource/run.sh
COPY test.sh /opt/resource/test.sh
COPY .flow_token /opt/resource/.flow_token
COPY .thread_id /opt/resource/.thread_id

RUN chmod +x /opt/resource/check /opt/resource/in /opt/resource/out /opt/resource/run.sh /opt/resource/test.sh
RUN chmod +rw /opt/resource/.flow_token /opt/resource/.thread_id
