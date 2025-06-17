pipeline {
    agent any

    triggers {
        pollSCM('* * * * *')
    }

    environment {
        VENV_DIR = 'venv'
    }

    stages {
        stage('Setup Python') {
            steps {
                sh 'python3 -m venv $VENV_DIR'
                sh '. $VENV_DIR/bin/activate && pip install --upgrade pip'
            }
        }
        stage('Install Dependencies') {
            steps {
                sh '. $VENV_DIR/bin/activate && pip install -r requirements.txt'
            }
        }
        stage('Run FastAPI App') {
            steps {
                sh 'nohup $VENV_DIR/bin/uvicorn main:app --host 0.0.0.0 --port 8000 &'  // Run in background
            }
        }
    }
    post {
        always {
            echo 'Pipeline finished.'
        }
    }
} 