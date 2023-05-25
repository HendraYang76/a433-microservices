# membuat Docker image dari Dockerfile dengan nama image <username-docker>/karsajobs dan memiliki tag latest
docker build -t hendrax76/karsajobs:latest .

# login ke Docker Hub
echo $PASSWORD_DOCKER_HUB | docker login -u hendrax76 --password-stdin

# mengunggah image ke Docker Hub
docker push hendrax76/karsajobs:latest
