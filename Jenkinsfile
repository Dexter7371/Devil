pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'dexter7371/hunts-point-pos'   // ✅ your Docker Hub repo
        DOCKER_CREDENTIALS_ID = 'dockerhub-creds-id'  // ✅ Jenkins credentials ID
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/dexter73710/Devil.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("${DOCKER_IMAGE}:latest")
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', "${DOCKER_CREDENTIALS_ID}") {
                        dockerImage.push()
                    }
                }
            }
        }
    }
}
