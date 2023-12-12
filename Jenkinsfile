pipeline {
    agent any
      environment {
        DOCKER_IMAGE = 'emnaboukhris10/devops_project'
    }

    stages {
        stage('Clone repository') {
            steps {
                git 'https://github.com/EmnaBoukhr/mongo-demo'
            }
        }
        stage('Build') {
            steps {
                sh './mvnw clean install'
            }
        }
        stage('Test') {
            steps {
                sh './mvnw test'
            }
        }
  stage('Docker build') {
            steps {
                script {
                    docker.build("${DOCKER_IMAGE}:${env.BUILD_NUMBER}")
                }
            }
        }
         stage('Deploy with Docker Compose') {
           steps {
             script {
                    sh 'docker-compose up -d'
        }
    }
}
         stage('Build Docker Compose') {
            steps {
                // Build your Docker Compose setup
                sh 'docker-compose build'
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
                        docker.image("${DOCKER_IMAGE}:${env.BUILD_NUMBER}").push()
                    }
                }
            }
        }
    }
}
