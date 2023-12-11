pipeline {
    agent any

    stages {
        stage('Clone repository') {
            steps {
                git 'https://github.com/oumaymafh/devops-project'
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
         /*stage('Docker build') {
            steps {
                script {
                    docker.build("${DOCKER_IMAGE}:${env.BUILD_NUMBER}")
                }
            }
        }*/
        stage('Build docker image') {
            steps {
                script {
                    sh 'docker build -t oumeymafarhat/devops-project .'
                }
            }
       
    }
}
