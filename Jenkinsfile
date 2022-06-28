pipeline {
    agent { label "built-in" }
    stages {
        stage("Install") {
            steps {
                dir("hello") {
                    sh "pipenv install"
                }
            }
        }
        stage("Unit test") {
            steps {
                dir("hello") {
                    sh "pipenv run python manage.py test"
                }
            }
        }
        stage("Docker build") {
            steps {
                sh "docker build -t phucknguyen/hello ."
            }
        }
        stage("Docker login") {
            steps {
                withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'docker-hub-credentials',
                        usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD']]) {
                    sh "docker login --username $USERNAME --password $PASSWORD"
                }
            }
        }
        stage("Docker push") {
            steps {
                sh "docker push phucknguyen/hello"
            }
        }
        stage("Deploy to staging") {
            steps {
                sh "docker run -d --rm -p 8000:8000 --name hello phucknguyen/hello"
            }
        }
        stage("Acceptance test") {
            steps {
                sleep 60
                sh "chmod +x acceptance_test.sh && ./acceptance_test.sh"
            }
        }
    }
    post {
        always {
            sh "docker stop hello"
        }
    }
}