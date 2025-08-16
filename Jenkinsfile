pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-cred')
        DOCKER_IMAGE = "your-dockerhub-username/devops1-frontend"
    }

    stages {
        stage('Clone Repo') {
            steps {
                git 'https://github.com/your-username/Devops1.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DOCKER_IMAGE .'
            }
        }

        stage('Login & Push to DockerHub') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
                sh 'docker push $DOCKER_IMAGE'
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh 'kubectl apply -f k8s-deployment.yaml'
                sh 'kubectl rollout status deployment/devops1-deployment'
            }
        }
    }
}

