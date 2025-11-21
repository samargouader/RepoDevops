pipeline {
    agent any
    tools {
        maven 'Maven-3.9' 
        jdk   'JDK-17'
    }
    stages {
        stage('Checkout') {
            steps {
                echo "Récupération du code depuis GitHub..."
                checkout scm
            }
        }
        stage('Compile') {
            steps {
                sh 'mvn -B clean compile'
            }
        }
        stage('Tests unitaires') {
            steps {
                sh 'mvn -B test'
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }
        stage('Package') {
            steps {
                sh 'mvn -B -DskipTests package'
            }
        }
        stage('Archive du JAR') {
            steps {
                archiveArtifacts artifacts: 'target/*.jar', allowEmptyArchive: false
            }
        }
    }
    post {
        success { echo 'Build réussi ! Le JAR est généré et archivé.' }
        failure { echo 'Échec du build – voir la console pour les erreurs.' }
    }
}