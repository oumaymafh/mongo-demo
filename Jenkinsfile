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
         
        stage('docker build image') {
            steps {
                script {
                    sh 'docker build -t oumaymafh/project-devops .'
                }
            }
        }
        stage('Build image to Hub') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
                        docker.image("oumaymafh/devops-project").push()
                    }
                }

            }
        }
            }
        }
    

        
       
    

