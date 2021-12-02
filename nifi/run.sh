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
sh config_cdc.sh
echo "Config OK"
IP=$(curl -s checkip.amazonaws.com)
echo ""
echo "URLs do projeto:"
echo ""
echo "\tNIFI            : $IP:8090"
echo "\tPRODUCER        : $IP:5001"
echo "\tKAFKA UI        : $IP:8070"
echo "\tDebezium UI     : $IP:8074"
echo ""
echo "\tKPostGres UI    : $IP:8070"
echo "\tKMongo UI       : $IP:8081"
echo "\tMySQL UI        : $IP:8082"
echo "\tRedis UI        : $IP:8083"
echo ""
echo "\tElastic UI      : $IP:5601"
echo ""
