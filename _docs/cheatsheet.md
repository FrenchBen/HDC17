# DevSum17

## Demo 1

Build v1:

WIN:
```
docker image build --tag frenchben/signup-web:v1 .\docker\web-v1
```
OSX:
```
docker image build --tag frenchben/signup-web:v1 docker/web-v1
```

Start v1:

SQL Server Express
```
docker container run --detach --name db -it -P --env ACCEPT_EULA=Y --env-file app/db-credentials.env --network nat microsoft/mssql-server-windows-express
```

Signup web
```
docker container run --detach --name web -P --env-file app/db-credentials.env --network nat frenchben/signup-web:v1
```


#### Compose
WIN:
```
docker-compose -f app\docker-compose-v1.yml up -d
```
OSX:
```
docker-compose -f app/docker-compose-v1.yml up -d
```

Show the sites listed:
```
docker container exec -it app_web_1 powershell `
Import-Module Webadministration
Get-ChildItem -Path IIS:\Sites
```

Get the IP of our app:

```
docker inspect --format '{{ .NetworkSettings.Networks.nat.IPAddress }}'  app_web_1
```

Check SQL:

WIN:
```
docker container exec app_db_1 powershell `
 "Invoke-SqlCmd -Query 'SELECT * FROM Prospects' -Database SignUp"
```
OSX:
```
docker container exec app_db_1 powershell \
 "Invoke-SqlCmd -Query 'SELECT * FROM Prospects' -Database SignUp"
```

## Demo 2

Build v2:

WIN:
```
docker image build --tag frenchben/signup-web -f docker\web\Dockerfile .

docker image build --tag frenchben/signup-save-handler -f docker\save-handler\Dockerfile .
```
OSX:
```
docker image build --tag frenchben/signup-web -f docker/web/Dockerfile .

docker image build --tag frenchben/signup-save-handler -f docker/save-handler/Dockerfile .
```

Start v2:

WIN:
```
docker-compose -f app\docker-compose-v2.yml up -d
```
OSX:
```
docker-compose -f app/docker-compose-v2.yml up -d
```

Get the IP of our app:

```
docker inspect --format '{{ .NetworkSettings.Networks.nat.IPAddress }}'  app_web_1
```

Check SQL:

```
docker container exec app_db_1 powershell `
 "Invoke-SqlCmd -Query 'SELECT * FROM Prospects' -Database SignUp"
```

Check Events:
```
docker container logs app_message-queue_1
```

Check Events container gnatsd.exe (Go app)
```
docker container top app_message-queue_1
```

## Demo 3

Build v3:

WIN:
```
docker image build --tag frenchben/signup-index-handler -f docker\index-handler\Dockerfile .
```
OSX:
```
docker image build --tag frenchben/signup-index-handler -f docker/index-handler/Dockerfile .
```

Start v3:

WIN:
```
docker-compose -f app\docker-compose-v3.yml up -d
```
OSX:
```
docker-compose -f app/docker-compose-v3.yml up -d
```
