pipeline {

    agent any

    stages {

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t banking-app .'
            }
        }

        stage('Run Container') {
            steps {
                sh 'docker rm -f banking-app || true'
                sh 'docker run -d --name banking-app -p 5000:5000 banking-app'
            }
        }
    }
}
