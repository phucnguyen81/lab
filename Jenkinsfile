pipeline {
    agent { label 'master' }
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
    }
}