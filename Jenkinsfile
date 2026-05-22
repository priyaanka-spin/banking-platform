pipeline {
    agent any

    environment {
        SCANNER_HOME = tool 'sonar-scanner'
    }

    stages {

        stage('Clone Code') {
            steps {
                git branch: 'main',
                url: 'https://github.com/priyaanka-spin/banking-platform.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t banking-app .'
            }
        }

        stage('Run Container') {
            steps {
                sh '''
                docker stop banking-app || true
                docker rm banking-app || true
                docker run -d --name banking-app -p 8081:80 banking-app
                '''
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
                    -Dsonar.login=squ_51e5812b70764bbf16aa87078098f9f2bb56a6b8
                    '''
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline succeeded!'
        }

        failure {
            echo 'Pipeline failed!'
        }
    }
}
