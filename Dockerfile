FROM microsoft/azure-functions-python3.6:v2.0.11737-alpha

ENV host:logger:consoleLoggingMode=always

COPY . /home/site/wwwroot

WORKDIR /home/site/wwwroot

RUN pip install -r requirements.txt
