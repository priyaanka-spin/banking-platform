pipeline {
    agent any

    tools {
        sonarQube 'sonar-scanner'
    }

    environment {
        SCANNER_HOME = tool 'sonar-scanner'
    }

    stages {

        stage('Clone') {
            steps {
                echo 'Code cloned'
            }
        }

        stage('SonarQube Scan') {
            steps {
                withSonarQubeEnv('sonarqube') {
                    sh '''
                    $SCANNER_HOME/bin/sonar-scanner \
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

        stage('Run Container') {
            steps {
                sh 'docker stop banking-app || true'
                sh 'docker rm banking-app || true'
                sh 'docker run -d --name banking-app -p 5000:5000 banking-app'
            }
        }

        stage('Verify') {
            steps {
                sh 'docker ps'
            }
        }
    }

    post {
        success {
            echo 'Pipeline Success'
        }

        failure {
            echo 'Pipeline Failed'
        }
    }
}
