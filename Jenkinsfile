pipeline {
    agent any

    stages {
        stage('GIT') {
            steps {
                script {
                    echo "Fetching code from GitHub (main branch)"
                    git branch: 'main', url: 'https://github.com/amraoui1920/timesheet-project.git'
                }
            }
        }
        
        stage('COMPILATION') {
            steps {
                script {
                    echo "Cleaning and compiling the project"
                    sh '''
                        mvn clean compile -DskipTests=true
                        mvn package -DskipTests=true
                    '''
                }
            }
        }
        
        stage('INSTALLATION') {
            steps {
                script {
                    echo "Building Docker image and pushing to DockerHub"
                    sh '''
                        docker build -t amraoui123/timesheet:1.1 .
                        docker login -u amraoui123 -p dckr_pat_zcvxvLyKcx_Dd-MXLYhzMkBZWzE
                        docker push amraoui123/timesheet:1.1
                    '''
                }
            }
        }
        
        stage('DEPLOIEMENT') {
            steps {
                script {
                    echo "Updating Kubernetes deployment with new image"
                    sh '''
                        kubectl set image deployment/timesheet-dep timesheet=amraoui123/timesheet:1.1 -n chap4
                        kubectl rollout status deployment/timesheet-dep -n chap4
                    '''
                }
            }
        }
    }
}
