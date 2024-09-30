pipeline {
    agent any

    stages {
        stage('clone repository') {
            git branch: 'main', url: 'https://github.com/mercant33/devops-s3.git'
        }
    }

    stage('Build Docker image') {
        steps {
            script {
                sh 'docker build -t my-mysql-image .'
            }
        }
    }

    stage ('Run MySQL container') {
        steps {
            script {
               sh '''
               docker run -d --name my-mysql-container \
               -e MYSQL_ROOT_PASSWORD=rootpassword \
               -e MYSQL_DATABASE=mydb \
               -e MYSQL_USER=user \
               -e MYSQL_PASSWORD=userpassword \
               -p 3306:3306 my-mysql-image
               '''
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
