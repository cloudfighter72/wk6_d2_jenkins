pipeline {
    agent any

    environment {
        // Use the ID you created in Jenkins Credentials
        DOCKER_HUB_CRED = credentials('7294d94a-3b0a-40f7-b2d6-4c2159d6393e')
        IMAGE_NAME = 'cloudfighter72/wk6-app'
    }

    stages {
        stage('Checkout') {
            // Fetches your source code from the specified repository.
            steps {
                git credentialsId: 'github-creds', url: 'https://github.com/cloudfighter72/wk6_d2_jenkins.git', branch: 'main'
            }
        }

        stage('Build Docker Image') {
            // Builds the local Docker image using the Dockerfile in the workspace.
            steps {
                sh "docker build -t ${IMAGE_NAME} ."
            }
        }

        stage('Push to Docker Hub') {
            // Logs into Docker Hub and pushes the built image securely.
            steps {
                script {
                    docker.withRegistry('', env.DOCKER_HUB_CRED_USR) {
                        sh "docker push ${IMAGE_NAME}"
                    }
                }
            }
        }
    }
}