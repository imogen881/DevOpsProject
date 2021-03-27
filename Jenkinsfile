pipeline {
    agent any
    environment {
        MYSQL_ROOT_PASSWORD = credentials("MYSQL_ROOT_PASSWORD")
        DOCKER_PASSWORD = credentials("DOCKER_PASSWORD")
    }
    stages {
        stage("Install Dependencies"){
            steps {
                sh "ansible-playbook -i inventory.yaml playbook.yaml"
            }
        }
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