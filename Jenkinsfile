pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                // Clona el repositorio de Git
                git branch: 'main', url: 'https://github.com/mercant33/devops-s3.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Usa el archivo Dockerfile para construir la imagen
                    sh 'docker build -t my-mysql-image .'
                }
            }
        }

        stage('Run MySQL Container') {
            steps {
                script {
                    // Levanta el contenedor con MySQL basado en la imagen creada
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
    }

    post {
        always {
            script {
                // Limpia el contenedor después de la ejecución
                sh 'docker stop my-mysql-container || true'
                sh 'docker rm my-mysql-container || true'
            }
        }
    }
}
