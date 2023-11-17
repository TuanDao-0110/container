FROM  confluent/postgres-bw:0.1

RUN ["apt-get", "update"]
RUN ["apt-get", "install", "-y", "vim"]