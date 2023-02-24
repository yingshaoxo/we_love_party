sudo docker-compose -f docker-compose.test.yaml down
sudo docker-compose -f docker-compose.test.yaml up -d
sudo docker-compose -f docker-compose.service.yaml logs -f
