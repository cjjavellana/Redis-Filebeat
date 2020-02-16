# Redis-Filebeat
Send redis logs in container to ELK using filebeat

## Usage

Starting elk container
```bash
$ docker-compose up -d elk
```

Starting redis container
```bash
$ docker-compose up -d redis
```

## Viewing Results

1. Navigate to http://localhost:5601
