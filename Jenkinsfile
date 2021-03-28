pipeline {
    agent any
    environment {
        DATABASE_URI = credentials("DATABASE_URI")
        SECRET_KEY = credentials("SECRET_KEY")
    }
    stages {
        stage("Build"){
            steps {
                sh "docker-compose build --parallel"
            }
        }
        stage("Push"){
            steps {
                sh "docker-compose push"
            }
        }
        stage("Deploy"){
            steps {
                sh "docker-compose up -d"
            }
        }
    }
}