echo "--- Update Wordpress Image "
localpath=$(pwd)
echo "--- Generate Dockerfile "
cat << EDL >> Dockerfile
FROM nginx:latest
# COPY ./scripts/wp-install.sh /var/html/www/wp-install.sh
WORKDIR /var/html/www/
#RUN sh wp-install.sh
EXPOSE 80 443
EDL

echo "--- Move Dockerfile to wordpress "
mv Dockerfile wordpress/

echo "--- Building image "
cd wordpress && docker build -t shrimp .

docker images | grep shrimp
docker push shrimp