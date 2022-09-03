FROM huginn/huginn:4df1217d3055db980a04f293e28016b77826e3ca

USER root

RUN apt update && apt install curl wget -y

USER 1001
