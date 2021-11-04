echo "Digite a URL da licença do Lenses que você recebeu no seu email: ex: https://licenses.lenses.io/download/lensesdl?id=00000000-0000-0000-0000-000000000000"
read EULA

sed -i 's|LICENSE|'$EULA'|' docker-compose.yml

IP=$(curl checkip.amazonaws.com) 

sed -i 's|PUBLIC_IP|'$IP'|' docker-compose.yml

docker-compose up -d
