pipeline {
    agent any

    environment {
        // Removed the problematic DOCKER_HUB_CRED line that caused the error
        IMAGE_NAME = 'cloudfighter72/wk6-app'
    }

    stages {
        stage('Checkout') {
            steps {
                git credentialsId: 'github-creds', url: 'https://github.com/cloudfighter72/wk6_d2_jenkins.git', branch: 'main'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "docker build -t ${IMAGE_NAME} ."
            }
        }

        stage('Push to Docker Hub') {
    steps {
        script {
            // Updated with the correct ID from Screenshot 2026-07-05 152023.png
            withCredentials([usernamePassword(credentialsId: 'd8bac7ce-aa69-4aaa-a6f1-1310e45524e5', passwordVariable: 'DOCKER_HUB_PWD', usernameVariable: 'DOCKER_HUB_USR')]) {
                sh "echo $DOCKER_HUB_PWD | docker login -u $DOCKER_HUB_USR --password-stdin"
                sh "docker push ${IMAGE_NAME}"
            }
        }
    }
}

