# Eve Database Docker Container Build Tools.

![MySQL](https://github.com/fallenreaper/eve-databases/workflows/Docker%20Image%20CI%20MYSQL/badge.svg)
![MSSQL](https://github.com/fallenreaper/eve-databases/workflows/Docker%20Image%20CI%20MSSQL/badge.svg)
![PosgreSQL](https://github.com/fallenreaper/eve-databases/workflows/Docker%20Image%20CI%20POSTGRES%20buildx/badge.svg)

This tool when receiving an update will spool up and build a new container with the lastest code.

The purpose of this is to test Github Actions in order to set up CICD Pipelines through github, creating and deploying Docker Containers.

As of Right now, it will pull and build the Eve Online Database in order to consume private or publically.  This database though was never containerized.  That is where this comes in.

If you have any questions please reach out.

Enjoy.

#Notes

- If needed, I can create different builds for additional DBMS, but these are the most common ive seen consumed.


#Additional Information

- Currently, it seems that MSSQL is currently having some difficulties, and will be looking into it as i get access to OS with the correct architecture.
- I have hosting services, servers, and cloud infrastructure to assist in launching and maintaining Databases for clients with minimal to no downtime and redundancy
