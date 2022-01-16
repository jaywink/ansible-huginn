FROM huginn/huginn:379e074b003aafc54ea5b17ca417ea0b2ac7a31e

USER root

RUN apt update && apt install curl wget -y

USER 1001
