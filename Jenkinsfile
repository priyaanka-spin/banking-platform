pipeline {
    agent any

    tools {
        sonarQube 'sonar-scanner'
    }

    stages {

        stage('SonarQube Scan') {
            steps {
                withSonarQubeEnv('sonarqube') {
                    sh '''
                    sonar-scanner \
                    -Dsonar.projectKey=banking-platform \
                    -Dsonar.sources=. \
                    -Dsonar.host.url=http://35.244.38.55:9000 \
                    -Dsonar.login=$SONAR_AUTH_TOKEN
                    '''
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t banking-app .'
            }
        }

    }
}
