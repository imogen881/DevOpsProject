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
                sh '''ssh -T -i '/home/jenkins/.ssh/id_rsa' ubuntu@54.74.1.255 -oStrictHostKeyChecking=no  << EOF
                      cd DevOpsProject
                      export DATABASE_URI=$DATABASE_URI
                      export SECRET_KEY=$SECRET_KEY
                      docker-compose build --parallel
EOF'''
            }
        }
        stage('Deploy'){
            steps {
                sh '''ssh -T -i '/home/jenkins/.ssh/id_rsa' ubuntu@54.74.1.255 -oStrictHostKeyChecking=no  << EOF
                      cd DevOpsProject
                      export DATABASE_URI=$DATABASE_URI
                      export SECRET_KEY=$SECRET_KEY
                      docker-compose up -d
EOF'''
            }
        }
    }
}
