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
                // sh "docker build -t phucknguyen/hello ."
                docker.build("phucknguyen/hello")
            }
        }
    }
}