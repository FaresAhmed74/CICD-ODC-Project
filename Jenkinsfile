pipeline {
    agent any

    environment {
        DOCKER_HUB_REPO = 'faresahmed74/flask-weather-app'
        IMAGE_TAG = 'latest'    
        LC_ALL = 'en_US.UTF-8'
        LANG = 'en_US.UTF-8'
        LANGUAGE = 'en_US.UTF-8'
    }

    stages {
        stage ('Pull Github-Repo') {
            steps {
                git branch: 'main', credentialsId: 'git-credits', url: 'git@github.com:FaresAhmed74/CICD-ODC-Project.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t ${DOCKER_HUB_REPO}:${IMAGE_TAG} ."
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'docker-hub-credits', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                        sh """
                        docker login -u ${DOCKER_USER} -p ${DOCKER_PASS}
                        docker push ${DOCKER_HUB_REPO}:${IMAGE_TAG}
                        """
                    }
                }
            }
        }
    
        
        stage('Setup Vagrant Machines') {
            steps {
                script {
                      sh 'chmod 600 vagrant1-key vagrant2-key'
                    
                   
                    sh """
                        export LC_ALL=en_US.UTF-8
                        export LANG=en_US.UTF-8
                        export LANGUAGE=en_US.UTF-8
                        ansible-playbook -i inventory.yml docker-playbook.yml
                        """
                        }
                    }
             }
    }
}



