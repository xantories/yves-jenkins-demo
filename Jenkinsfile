pipeline {
    agent any

    environment {
        IMAGE_NAME = 'fastapi-app:latest'
        CONTAINER_NAME = 'fastapi-app-container'
    }

    stages {
        stage('Show user') {
            steps {
                sh 'echo $USER'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }
        stage('Run Docker Container') {
            steps {
                sh 'docker rm -f $CONTAINER_NAME || true'
                sh 'docker run -d --name $CONTAINER_NAME -p 8000:8000 $IMAGE_NAME'
            }
        }
    }
    post {
        always {
            echo 'Pipeline finished.'
        }
    }
} 
