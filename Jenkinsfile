pipeline {
    agent any

    environment {
        IMAGE_NAME = 'cloudfighter72/wk6-app'
    }

    stages {
        stage('Checkout') {
            steps {
                // Ensure 'github-creds' exists in your Jenkins credentials
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
                    // Using the new simple ID: docker-hub-login
                    withCredentials([usernamePassword(credentialsId: 'docker-hub-login', passwordVariable: 'DOCKER_HUB_PWD', usernameVariable: 'DOCKER_HUB_USR')]) {
                        // Using single quotes to prevent insecure interpolation
                        sh 'echo "$DOCKER_HUB_PWD" | docker login -u "$DOCKER_HUB_USR" --password-stdin'
                        sh "docker push ${IMAGE_NAME}"
                    }
                }
            }
        }
    }
}