docker build --no-cache=true -t skuarch/sonar:5.6 .

docker run --name sonar -itd -p 9000:9000 skuarch/sonar:5.6

docker start sonar
