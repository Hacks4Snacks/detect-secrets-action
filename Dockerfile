FROM python:3.9

RUN pip install --no-cache-dir detect-secrets 

COPY entrypoint.sh /entrypoint.sh
RUN groupadd -r secret-scan && useradd --no-log-init -r -g secret-scan secret-scan \
    && chmod +x /entrypoint.sh

#USER secret-scan
#WORKDIR /tmp

ENV REQUIRE_BASELINE=0 ADDL_ARGS="" BASELINE_FILE="./.secrets.baseline"

ENTRYPOINT ["/entrypoint.sh"]