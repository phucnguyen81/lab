pipeline {
    agent any
    triggers {
        pollSCM('* * * * *')
    }
    stages {
        stage("Check out") {
            steps {
                sh "rm -r -f hello"
                sh "git clone --branch hello https://github.com/phucnguyen81/ci-docker-jenkins.git hello"
            }
        }
        stage("Install") {
            steps {
                dir("hello/hello") {
                    sh "pipenv install"
                }
            }
        }
        stage("Unit test") {
            steps {
                dir("hello/hello") {
                    sh "pipenv run python manage.py test"
                }
            }
        }
    }
}