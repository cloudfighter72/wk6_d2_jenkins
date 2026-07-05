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
                    // Using withCredentials to safely bind and use your credentials
                    withCredentials([usernamePassword(credentialsId: '7294d94a-3b0a-40f7-b2d6-4c2159d6393e', passwordVariable: 'DOCKER_HUB_PWD', usernameVariable: 'DOCKER_HUB_USR')]) {
                        // Log in using the credentials before pushing
                        sh "echo $DOCKER_HUB_PWD | docker login -u $DOCKER_HUB_USR --password-stdin"
                        sh "docker push ${IMAGE_NAME}"
                    }
                }
            }
        }
    }
}