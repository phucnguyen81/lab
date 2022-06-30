# Description

Learning PostgreSQL.

- Pull postgres image: docker pull postgres:14.4-bullseye
- Run postgres: docker run --name postgres -e POSTGRES_PASSWORD=postgres -d postgres:14.4-bullseye
- Use psql inside container: docker exec -it postgres psql -U postgres
