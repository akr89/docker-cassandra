FROM cassandra:3.11

LABEL version_tags="[\"3.11\"]"
LABEL maintainer="Akrom Khasani <akrom@kofera.com>"

RUN perl -pi.bak \
        -e "s/(?<=^authenticator:\s)\w+/PasswordAuthenticator/;" \
        -e "s/(?<=^authorizer:\s)\w+/CassandraAuthorizer/;" \
        /etc/cassandra/cassandra.yaml
