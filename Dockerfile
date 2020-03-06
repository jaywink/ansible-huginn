FROM huginn/huginn:df859ae009a1339856117eb5ce9ce59c852dbec4

USER root

RUN apt update && apt install curl wget -y

USER 1001
