
## v1

```
docker build -t frenchben/hdc-web:v1 .\docker\web-v1

docker-compose -f .\app\docker-compose-v1.yml up -d
```

## v2

```
docker build -t frenchben/hdc-web:v2 -f docker\web-v2\Dockerfile .

docker build -t frenchben/hdc-save-handler -f docker\save-handler\Dockerfile .

docker-compose -f .\app\docker-compose-v2.yml up -d
```

## v3

> On Win10 need to run Elasticsearch separately to specify memory:
```
docker run -d -P --name elasticsearch --memory 2.5G frenchben/elasticsearch:nanoserver
```

```
docker build -t frenchben/hdc-index-handler -f docker\index-handler\Dockerfile .

docker-compose -f .\app\docker-compose-v3.yml up -d
```

## v4

```
docker build -t frenchben/hdc-homepage .\docker\homepage

docker-compose -f .\app\docker-compose-v4.yml up -d
```

## vNext

```
docker run -d -P --name cms frenchben/umbraco-demo:i2d 
```