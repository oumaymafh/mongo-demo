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
         
        stage('Docker build') {
            steps {
                script {
                    docker.build("oumeymafarhat/devops-project")
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
                        docker.image("oumeymafarhat/devops-project").push()
                    }
                }
            }
        }
         stage('Build Docker Compose') {
            steps {
                // Build your Docker Compose setup
                sh 'docker-compose build'
            }
        }
        stage('Up Docker Compose') {
            steps {
                // Start your Docker Compose setup
                sh 'docker-compose up -d'
            }
        }
         
       stage('Check Volume Persistence') {
            steps {
                // Run a command that checks volume persistence
                // Replace this with the actual command you want to run
                sh 'docker inspect mongo-demo_mongodb_data_container'
            }
        }
   


   }
 }
    

    

        
       
    

