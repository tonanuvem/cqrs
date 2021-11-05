file="mongo_order.json"
docker-compose exec mongo mongoimport --drop --host localhost --port 27017 --db "order" --collection "$(basename $file .json)" --file $file
