pipeline {
    agent any

    stages {

        stage('Clone') {
            steps {
                echo 'Cloning done'
            }
        }

        stage('Build Image') {
            steps {
                sh 'docker build -t banking-app .'
            }
        }

        stage('Run Container') {
            steps {
                sh 'docker run -d --name banking-app -p 5000:5000 banking-app || true'
            }
        }

        stage('Check') {
            steps {
                sh 'docker ps'
            }
        }
    }
}
