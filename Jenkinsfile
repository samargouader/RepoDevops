pipeline {
    agent any

    tools {
        maven 'M2_HOME'
        jdk   'JAVA_HOME'
    }

    stages {
        stage('GIT') {
            steps {
                echo "Récupération du code depuis GitHub..."
                checkout scm
                sh 'git log --oneline -5'
            }
        }

        stage('Compile') {
            steps {
                echo "Compilation du projet..."
                sh 'mvn -B clean compile'
            }
        }

        stage('Tests unitaires') {
            steps {
                echo "Exécution des tests unitaires..."
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
        success { 
            echo '✅ Build réussi ! Le JAR est généré et archivé.'
        }
        failure { 
            echo '❌ Échec du build – voir la console pour les erreurs.'
        }
    }
}