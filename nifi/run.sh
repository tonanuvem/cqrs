# Liberando a porta no caso de rodar no Cloud9
sudo service mysql stop

docker-compose up -d

echo ""
echo "Aguardando a configuração do NIFI."
while [ "$(docker logs nifi_nifi_1 2>&1 | grep "Controller initialization took" | wc -l)" != "1" ]; do
  printf "."
  sleep 1
done
echo "Aguardando a configuração do Debezium CDC (Change Data Capture)."
while [ "$(docker logs nifi_connect_1 2>&1 | grep "Finished starting connectors and tasks" | wc -l)" != "1" ]; do
  printf "."
  sleep 1
done
echo ""
sh mongo_import_order_database.sh 
sh config_cdc.sh
echo "Config OK"
IP=$(curl -s checkip.amazonaws.com)
echo ""
echo "URLs do projeto:"
echo ""
echo " - NIFI            : $IP:8090/nifi"
echo " - PRODUCER        : $IP:5001"
echo " - KAFKA UI        : $IP:8070"
echo " - Debezium UI     : $IP:8074"
echo ""
echo " - PostGres UI    : $IP:8070"
echo " - Mongo UI       : $IP:8081"
echo " - MySQL UI        : $IP:8082"
echo " - Redis UI        : $IP:8083"
echo ""
echo " - Elastic UI      : $IP:5601"
echo ""
