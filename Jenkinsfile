pipeline{
    agent any
    environment {
        DATABASE_URI = credentials("DATABASE_URI")
        SECRET_KEY = credentials("SECRET_KEY")
        DOCKER_PASSWORD = credentials("DOCKER_PASSWORD")
    }
    stages{
        stage('Build'){
            steps {
                sh '''cd DevOpsProject  << EOF
                      docker-compose build --parallel
EOF'''
            }
        }
        stage('Deploy'){
            steps {
                sh '''cd DevOpsProject  << EOF
                      docker-compose up -d
EOF'''
            }
        }
    }
}
