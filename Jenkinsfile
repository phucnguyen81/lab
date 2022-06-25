pipeline {
    agent any
    triggers {
        pollSCM('* * * * *')
    }
    stages {
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