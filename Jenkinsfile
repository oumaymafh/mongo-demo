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
        stage('Deploy with Docker Compose') {
           steps {
             script {
                    sh 'docker-compose up -d'
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
        stage('Deploy to k8s') {
            steps {
                script {kubernetesDeploy configs: 'deploymentservice.yam',kubeconfigId: 'k8sconfig' )
                       }
                
            }
        }

   }
 }
    

    

        
       
    

