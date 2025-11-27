pipeline {
    agent any

    tools {
        maven 'M2_HOME'
        jdk   'JAVA_HOME'
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
                sh 'mvn -B test -DskipTests'
            }
        }

        stage('Package') {
            steps {
                echo 'Génération du JAR...'
                sh 'mvn -B -DskipTests clean package'
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