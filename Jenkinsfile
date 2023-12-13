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
                    echo 'Building Docker image...'

                    withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'PASS', usernameVariable: 'USER')]) {

                        sh "echo $PASS | docker login -u $USER --password-stdin"

                        sh 'docker push oumeymafarhat/devops-project'
                    }
                }
                }
            }
        
        stage('Deploy') {
            steps {
                script {
                    withKubeConfig([credentialsId: 'kubeconf']) {
                    sh """
                          minikube kubectl -- apply -f deploymentservice.yaml                    
                    """
                    }
                }
            }
        }
            
   }
 }
    

    

        
       
    

