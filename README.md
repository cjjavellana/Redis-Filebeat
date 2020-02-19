# Redis-Filebeat
Send redis logs in container to ELK using filebeat

## Usage

```Starting all containers
$ docker-compose up
```

Starting elk container
```bash
$ docker-compose up -d elk
```

Starting redis container
```bash
$ docker-compose up -d redis
```

Starting logstash container
```bash
$ docker-compose up -d logstash
```

## Viewing Results

1. Navigate to http://localhost:5601
