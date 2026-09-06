FROM postgres:18

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        lsb-release \
        wget \
        postgresql-common; \
    /usr/share/postgresql-common/pgdg/apt.postgresql.org.sh -y; \
    codename="$(lsb_release --codename --short)"; \
    wget -q \
        "https://packages.groonga.org/debian/groonga-apt-source-latest-${codename}.deb"; \
    apt-get install -y -V \
        "./groonga-apt-source-latest-${codename}.deb"; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        postgresql-18-pgdg-pgroonga; \
    rm -f "groonga-apt-source-latest-${codename}.deb"; \
    rm -rf /var/lib/apt/lists/*
