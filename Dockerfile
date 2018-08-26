FROM cassandra:3.11

LABEL version_tags="[\"3.11\"]"
LABEL maintainer="Akrom Khasani <akrom@kofera.com>"

# Set authentication and authorization
RUN perl -pi".bak" \
        -e "s/(?<=^authenticator:\s)\w+/PasswordAuthenticator/;" \
        -e "s/(?<=^authorizer:\s)\w+/CassandraAuthorizer/;" \
        /etc/cassandra/cassandra.yaml

# Add healthcheck
ADD ./docker-healthcheck.sh /usr/local/
RUN chmod a+x /usr/local/docker-healthcheck.sh
HEALTHCHECK --interval=3m \
    CMD /usr/local/docker-healthcheck.sh
