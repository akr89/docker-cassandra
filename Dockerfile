FROM cassandra:3.11

LABEL version_tags="[\"3.11\"]"
LABEL maintainer="Akrom Khasani <akrom@kofera.com>"

RUN cp -u /etc/cassandra/cassandra.yaml /etc/cassandra/cassandra.yaml.bak && \
    perl -pi -e "s/(?<=^authenticator:\s)\w+/PasswordAuthenticator/" /etc/cassandra/cassandra.yaml && \
    perl -pi -e "s/(?<=^authorizer:\s)\w+/CassandraAuthorizer/" /etc/cassandra/cassandra.yaml
