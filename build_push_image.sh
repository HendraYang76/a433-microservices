# membuat Docker image dari Dockerfile dengan nama image item-app dan memiliki tag v1
docker build -t item-app:v1 .

# melihat daftar image di lokal
docker images

# mengubah nama image agar sesuai dengan format Docker Hub
docker tag item-app:v1 hendrax76/item-app:v1

# login ke Docker Hub
echo $PASSWORD_DOCKER_HUB | docker login -u hendrax76 --password-stdin

# mengunggah image ke Docker Hub
docker push hendrax76/item-app:v1
