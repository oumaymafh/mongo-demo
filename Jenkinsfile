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
                        withCredentials([string(credentialsId: 'dockerhub', variable: 'dockerhub')]) {
                        sh 'docker login -u oumaymafh -p ${dockerhub}'
                        }
                    sh 'docker push oumaymafh/devops-project'

                        }
            }
        }
    }
    
}

        
       
    

