FROM coding-public-docker.pkg.coding.net/public/docker/openjdk:8

COPY ./build/libs/cloud.jar /root/workspace/cloud.jar

CMD ["java", "-jar", "./cloud.jar"]
