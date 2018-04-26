FROM microsoft/azure-functions-python3.6:v2.0.11651-alpha

ENV host:logger:consoleLoggingMode=always

COPY . /home/site/wwwroot

RUN cd /home/site/wwwroot && \
    /bin/bash -c \
    "source /workers/worker_env/bin/activate &&\
    pip3 install -r requirements.txt"
