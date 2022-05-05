FROM huginn/huginn:6bf00318b0a38651133ff95728105f4d844aa49c

USER root

RUN apt update && apt install curl wget -y

USER 1001
