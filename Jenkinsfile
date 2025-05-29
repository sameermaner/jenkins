pipeline {
  agent any
 
  environment {
    IMAGE_NAME = "sameermaner/jenkins"
    DOCKER_CREDENTIALS_ID = 'docker-hub-creds'
  }
 
  stages {
    stage('Checkout') {
      steps {
        git credentialsId: 'github-creds', url: 'https://github.com/sameermaner/jenkins.git'
      }
    }
 
    stage('Build Docker Image') {
      steps {
        script {
          dockerImage = docker.build("${IMAGE_NAME}:${env.BUILD_NUMBER}")
        }
      }
    }
 
    stage('Push to Docker Hub') {
      steps {
        script {
          docker.withRegistry('https://index.docker.io/v1/', DOCKER_CREDENTIALS_ID) {
            dockerImage.push()
            dockerImage.push("latest")  // optional
          }
        }
      }
    }
  }
 
  post {
    success {
      echo "Image pushed successfully!"
    }
    failure {
      echo "Build failed!"
    }
  }
}
