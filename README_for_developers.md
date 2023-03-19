# We Love Party

## start the service
```bash
cd party_protocols

docker-compose -f docker-compose.service.yaml up -d

docker-compose -f docker-compose.service.yaml logs -f
```

## rebuild docker image
I made a script called `development_tools_party.py` under the root folder

You could use a command like the following to rebuilt a docker image: 

```bash
python development_tools_party.py rebuild_free_map_service

#or 

development_tools_party rebuild_free_map_service
```