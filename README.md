# FastAPI Hello World Demo

This is a dead simple FastAPI application with Jenkins CI/CD integration. It demonstrates how to build, deploy, and serve a Python FastAPI app with automated deployment on every push to the `main` branch.

---

## 🚀 Features
- **FastAPI** app with two endpoints:
  - `/` — Returns `Hello, world!`
  - `/user/{name}` — Returns `Hello {name}`
- **Jenkins Pipeline** for automated deployment on every push to `main`

---

## 📂 Project Structure
```
jenkins-demo/
├── Jenkinsfile         # Jenkins pipeline definition
├── main.py             # FastAPI application
├── requirements.txt    # Python dependencies
└── README.md           # Project documentation
```

---

## 🖥️ Endpoints

### `GET /`
Returns a simple hello world message.

**Response:**
```
Hello, world!
```

### `GET /user/{name}`
Returns a personalized hello message.

**Example:**
```
GET /user/Alice
```
**Response:**
```
Hello Alice
```

---

## ⚙️ Local Development

1. **Clone the repository:**
   ```bash
   git clone <your-repo-url>
   cd jenkins-demo
   ```
2. **Create a virtual environment and install dependencies:**
   ```bash
   python3 -m venv venv
   source venv/bin/activate
   pip install -r requirements.txt
   ```
3. **Run the FastAPI app:**
   ```bash
   uvicorn main:app --reload
   ```
4. **Access the app:**
   - [http://localhost:8000/](http://localhost:8000/) — Hello World
   - [http://localhost:8000/user/YourName](http://localhost:8000/user/YourName) — Personalized Hello

---

## 🤖 Jenkins CI/CD Pipeline

This project includes a `Jenkinsfile` for automated deployment:

- **Trigger:** On every push to the `main` branch (via SCM polling)
- **Steps:**
  1. Set up a Python virtual environment
  2. Install dependencies
  3. Launch the FastAPI app using Uvicorn

### Jenkinsfile Overview
```groovy
pipeline {
    agent any
    triggers {
        pollSCM('* * * * *') // Checks for changes every minute
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
```

### Jenkins Setup Instructions
1. **Install Jenkins** and required plugins (e.g., Git, Pipeline).
2. **Create a new Pipeline job** and point it to your repository.
3. **Ensure Python 3 and virtualenv are available** on the Jenkins agent.
4. **Configure credentials** if your repository is private.
5. **Start the pipeline** — it will auto-deploy on every push to `main`.

---

## 📝 Notes
- For production, consider using Docker, a process manager (e.g., systemd, Supervisor), and a proper web server (e.g., Nginx) for serving FastAPI.
- The current Jenkins pipeline uses SCM polling for demonstration. For instant deployment, set up a webhook trigger.

---

## 📄 License
MIT 