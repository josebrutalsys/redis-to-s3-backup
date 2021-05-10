FROM redis:6.2-buster

RUN apt-get update && apt-get install -y python python-pip
RUN pip install awscli

ADD run.sh /data/run.sh

CMD ["/data/run.sh"]