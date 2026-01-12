pipeline {
    agent any

    options {
        buildDiscarder(logRotator(numToKeepStr: '10'))
        timeout(time: 30, unit: 'MINUTES')
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Test') {
            steps {
                script {
                    // Run Groovy tests
                    sh './gradlew test'
                }
            }
            post {
                always {
                    // Publish test results
                    junit 'build/test-results/**/*.xml'
                    // Publish test coverage report
                    publishHTML([
                        reportDir: 'build/reports/jacoco/test/html',
                        reportFiles: 'index.html',
                        reportName: 'Test Coverage Report',
                        keepAll: true
                    ])
                }
            }
        }

        stage('Code Quality') {
            steps {
                script {
                    // Run code quality checks
                    sh './gradlew codenarcMain codenarcTest'
                }
            }
            post {
                always {
                    // Publish code quality report
                    publishHTML([
                        reportDir: 'build/reports/codenarc',
                        reportFiles: 'main.html',
                        reportName: 'Code Quality Report (Main)',
                        keepAll: true
                    ])
                    publishHTML([
                        reportDir: 'build/reports/codenarc',
                        reportFiles: 'test.html',
                        reportName: 'Code Quality Report (Test)',
                        keepAll: true
                    ])
                }
            }
        }
    }

    post {
        always {
            cleanWs()
        }
        success {
            echo 'Library tests passed successfully'
        }
        failure {
            echo 'Library tests failed'
        }
    }
}

