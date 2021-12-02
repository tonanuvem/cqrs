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
echo ""
