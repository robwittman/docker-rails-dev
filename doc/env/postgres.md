## PostgreSQL Service

This service provides an accessible postgres datastore. To use out of the box:

```yml
    ### Uncomment this section in docker-compose.yml
    postgres:
        image: postgres:9.6  # You can change this for a different version
```

To allow the rails container to access the new postgres service, add `postgres` to its links in `docker-compose.yml`, and add connection settings to `.env`.

### Host Access
If you want to access the postgres service from outside the docker-compose network, add
```yml
    ports:
        - "5432:5432"
```
**NOTE The postgres container already exposes 5432 internally, so you dont need to provide it in compose.yml**

### Data Persistence

By default, this will not persist any data from the container. The easiest way to save data to the host is mounting
a volume.
```yml
    volumes:
        - /var/lib/postgresql:/var/lib/postgresql/data
```
You can also change the container directory where postgres stores data using the PGDATA envrionment variable
```yml
    environment:
        - PGDATA=/somewhere/to/store/data
```
### Authentication

You can specify some environment variables to control authentication
```yml
    environment:
        - POSTGRES_PASSWORD=superrandompassword # Password for postgres superuser
        - POSTGRES_USER=postgres # Postgres username
        - POSTGRES_DB=postgres # Database to use
```

### Build arguments

You can also pass command line arguments to PostgreSQL. This can be used to add / remove functionality at build time
```yml
    environment:
        - POSTGRES_INITDB_ARGS="--data-checksums"
```
