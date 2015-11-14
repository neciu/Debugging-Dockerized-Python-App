# Usage
1. Run helper script `./build-core-django.sh`. It will build core image.
2. Run docker compose command: `docker-compose -f docker-compose-development.yml up`. It will build development image, and then run it with Postgres container.
3. Check if everything is ok: `docker ps`. There should be 2 containers running: `debuggingdockerizedpythonapp_django_1` and `debuggingdockerizedpythonapp_postgres_1`. Note that the firs one is forwarding two ports: `2000` for SSH connection and `8080` for webserver.
4. In PyCharm, add new python interpreter. Choose **remote** and fill it's configuration with settings:
- Host: `your host ip address (for my docker-mashine: 192.168.99.100)`
- Port: `2000`
- Username: `root`
- Password: `password`
- Interpreter path: `/usr/local/bin/python`
5. For the first time it may complain about new host and so on. So don't worry.
6. Add new run configuration with settings:
- Host: `0.0.0.0`
- Port: `8080`
- Environment variables: `DJANGO_SETTINGS_MODULE=myapp.settings`
- Working directory: `/app`
- Path mappings: `your absolute path to project direcory=/app`
7. Hit run button! You should get fresh running Django app.
8. Now set breakpoint in setting file and start debug.
9. Voilà!