pipeline {
    agent any

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
    }
}
