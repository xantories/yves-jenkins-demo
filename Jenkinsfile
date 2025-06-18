pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t fastapi-image .'
            }
        }
        stage('Run Docker Container') {
            steps {
                sh 'docker rm -f fastapi-app-container || true'
                sh 'docker run -d --name fastapi-app-container -p 8082:80 fastapi-image'
            }
        }
    }
}
