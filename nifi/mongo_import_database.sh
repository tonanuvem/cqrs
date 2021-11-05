file="/data/mongo_order.json"
docker-compose exec mongo mongoimport --drop --host localhost --port 27017 --db "pedidos" --collection "order" --file $file
