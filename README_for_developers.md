# We Love Party

## start the service
```bash
cd party_protocols

docker-compose -f docker-compose.service.yaml up -d

docker-compose -f docker-compose.service.yaml logs -f
```

## firewall

ufw status

```
22                         ALLOW       Anywhere                  
1310                       ALLOW       Anywhere                  

80                         ALLOW       Anywhere                  
5349                       ALLOW       Anywhere                  
7880                       ALLOW       Anywhere                  
50000:60000/udp            ALLOW       Anywhere                  
25                         ALLOW       Anywhere                  
```

## rebuild docker image
I made a script called `development_tools_party.py` under the root folder

You could use a command like the following to rebuilt a docker image: 

```bash
python development_tools_party.py rebuild_free_map_service

#or 

development_tools_party rebuild_free_map_service
```