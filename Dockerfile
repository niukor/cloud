FROM coding-public-docker.pkg.coding.net/public/docker/openjdk:8

COPY ./build/libs/cloud_cd.jar /root/workspace/cloud_cd.jar

CMD ["java", "-jar", "./cloud_cd.jar"]
