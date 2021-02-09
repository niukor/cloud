pipeline {
  agent any
  stages {
    stage('检出') {
      agent any
      steps {
        checkout([$class: 'GitSCM',
        branches: [[name: GIT_BUILD_REF]],
        userRemoteConfigs: [[
          url: GIT_REPO_URL,
          credentialsId: CREDENTIALS_ID
        ]]])
      }
    }
    stage('单元测试') {
      agent any
      post {
        always {
          junit 'build/test-results/**/*.xml'

        }

      }
      steps {
        sh 'chmod 777 ./gradlew'
        sh './gradlew test'
      }
    }
    stage('编译') {
      agent any
      steps {
        sh './gradlew build'
      }
    }
    stage('构建镜像并推送到 CODING Docker 制品库') {
      agent any
      steps {
        script {
          docker.withRegistry(
            "${CCI_CURRENT_WEB_PROTOCOL}://${CODING_DOCKER_REG_HOST}",
            "${CODING_ARTIFACTS_CREDENTIALS_ID}"
          ) {
            def dockerImage = docker.build("${CODING_DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_VERSION}", "-f ${DOCKERFILE_PATH} ${DOCKER_BUILD_CONTEXT}")
            dockerImage.push()
          }
        }

      }
    }
  }
  environment {
    CODING_DOCKER_REG_HOST = "${CCI_CURRENT_TEAM}-docker.pkg.${CCI_CURRENT_DOMAIN}"
    CODING_DOCKER_IMAGE_NAME = "${PROJECT_NAME.toLowerCase()}/${DOCKER_REPO_NAME}/${DOCKER_IMAGE_NAME}"
  }
}