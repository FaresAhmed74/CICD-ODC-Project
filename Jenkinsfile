pipeline {
    agent any

    environment {
        DOCKER_HUB_REPO = 'faresahmed74/flask-weather-app'
        IMAGE_TAG = 'latest'                      
    }

    stages {
        stage ('Clone Github-Repo') {
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
        
        stage('Set Up SSH Keys') {
            steps {
                script {
                    withCredentials([
                        sshUserPrivateKey(credentialsId: 'vagrant1-ssh-key', keyFileVariable: 'VAGRANT1_KEY'),
                        sshUserPrivateKey(credentialsId: 'vagrant2-ssh-key', keyFileVariable: 'VAGRANT2_KEY')
                    ]) {
                        sh """
                        mkdir -p ~/.ssh
                        cp ${VAGRANT1_KEY} ~/.ssh/vagrant1_insecure_key
                        cp ${VAGRANT2_KEY} ~/.ssh/vagrant2_insecure_key
                        chmod 600 ~/.ssh/vagrant1_insecure_key
                        chmod 600 ~/.ssh/vagrant2_insecure_key
                        """
                    }
                }
            }
        }
        
        stage('Install Docker on Vagrant Machines') {
            steps {
                script {
                     sh """
                        ansible-playbook -i ansible_files/inventory.yml ansible_files/install_docker.yml
                         """
                        }
                    }
             }

    }
}



