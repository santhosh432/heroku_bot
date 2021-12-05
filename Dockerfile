FROM ubuntu:18.04
ENTRYPOINT []

RUN pip3 install --upgrade pip

RUN apt-get update && apt-get install -y python3 python3-pip && python3 -m pip install --no-cache --upgrade pip

ADD . /app/

COPY requirements.txt /tmp

WORKDIR /tmp

RUN pip install -r requirements.txt

WORKDIR /app


RUN chmod +x /app/start_services.sh

CMD /app/start_services.sh