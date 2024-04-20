pipeline {

    agent any
    tools {dockerTool  "docker" }
    parameters {
        choice(name: 'ACTION', choices: ['Build', 'Remove all'], description: 'Pick something')
    }
    stages {
        stage('Building/Deploying') {
            when{
                environment name: 'ACTION', value: 'Build'
            }
            steps {
                withDockerRegistry(credentialsId: 'dockerhub', url: 'https://index.docker.io/v2/') {
                    sh 'docker compose up -d --build'
                    sh 'docker compose push'
                }
            }
        }
        stage('Removing all') {
            when{
                environment name: 'ACTION', value: 'Remove all'
            }
            steps {
                sh 'docker compose down -v '
            }
        }
    }
    post {
        // Clean after build
        always {
            cleanWs()
        }
    }
}