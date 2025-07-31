FROM ubuntu:20.04
LABEL maintainer="itnsapurbalingga"
LABEL version="4.6.2"
LABEL description="ExtraOrdinaryCBT v4.6.0 (Docker) [Unofficial]"
USER root
WORKDIR "/app"
RUN apt update && \
    apt install -y tzdata wget nano unzip
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
# download & langsung ekstrak ke /app
ADD https://s3.ekstraordinary.com/extraordinarycbt/release-rosetta/4.6.2-linux.zip exocbt.zip
RUN unzip -q -o exocbt.zip && \
    rm -f exocbt.zip
COPY entrypoint.sh .
COPY wait-for-it.sh .
RUN chmod +x *.sh
RUN chmod +x *.sh main-amd64 
ENTRYPOINT ["./entrypoint.sh"]
CMD ["./main-amd64"]