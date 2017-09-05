
## v1

Build v1:
```
docker image build --tag frenchben/hdc-web:v1 .\docker\web-v1
```

Run v1:
```
docker-compose -f .\app\docker-compose-v1.yml up -d
```

Get the IP of our app:
```
docker inspect --format '{{ .NetworkSettings.Networks.nat.IPAddress }}'  app_app_1
```

Check SQL:
```
docker container exec app_db_1 powershell `
 "Invoke-SqlCmd -Query 'SELECT * FROM Prospects' -Database SignUp"
```

## v2

Build v2:
```
docker image build --tag frenchben/hdc-web:v2 -f docker\web-v2\Dockerfile .

docker image build --tag frenchben/hdc-save-handler -f docker\save-handler\Dockerfile .
```

Run v2:
```
docker-compose -f .\app\docker-compose-v2.yml up -d
```

## v3

> On Win10 need to run Elasticsearch separately to specify memory:
```
docker run -d -P --name elasticsearch --memory 2.5G frenchben/elasticsearch:nanoserver
```

Build v3:
```
docker image build --tag frenchben/hdc-index-handler -f docker\index-handler\Dockerfile .
```

Run v3:
```
docker-compose -f .\app\docker-compose-v3.yml up -d
```

## v4

Build v4:
```
docker image build --tag frenchben/hdc-homepage .\docker\homepage
```

Run v4:
```
docker-compose -f .\app\docker-compose-v4.yml up -d
```

## vNext

```
docker run -d -P --name cms frenchben/umbraco-demo:i2d 
```