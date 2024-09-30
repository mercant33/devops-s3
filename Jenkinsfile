pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/mercant33/devops-s3.git'
            }
        }

        stage('List Files') {
            steps {
                sh 'ls -la'
                sh 'cat Dockerfile'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t my-mysql-image .'
                }
            }
        }

        stage('Run MySQL Container') {
            steps {
                script {
                    sh '''
                    docker run -d --name my-mysql-container \
                    -p 3306:3306 my-mysql-image
                    '''
                }
            }
        }
    }

    post {
        always {
            script {
                sh 'docker stop my-mysql-container || true'
                sh 'docker rm my-mysql-container || true'
            }
        }
    }
}
