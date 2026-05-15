FROM ubuntu:20.04
ENV NAME=Lubos
RUN apt-get update && \
    apt-get install -y python3 && \
    rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY hello.py .
ENTRYPOINT ["python3", "hello.py"]