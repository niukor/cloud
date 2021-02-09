FROM coding-public-docker.pkg.coding.net/public/docker/openjdk:8

COPY ./build/libs/tke.jar /root/workspace/tke.jar

CMD ["java", "-jar", "./tke.jar"]
