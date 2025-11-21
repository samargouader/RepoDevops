pipeline {
    agent any

    // Utilise la version de Maven configurée dans Jenkins (à vérifier dans Global Tool Configuration)
    tools {
        maven 'Maven-3.9'    // change si ton Maven dans Jenkins s'appelle autrement
        jdk   'JDK-17'       // change si ton JDK s'appelle autrement
    }

    stages {
        stage('Checkout') {
            steps {
                echo "Récupération du code depuis GitHub..."
                checkout scm
                // ou explicitement :
                // git url: 'https://github.com/samargouader/RepoDevops.git', branch: 'main'
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
                    junit 'target/surefire-reports/*.xml'   // affiche les résultats des tests dans Jenkins
                }
            }
        }

        stage('Package') {
            steps {
                sh 'mvn -B -DskipTests package'   // génère le JAR dans target/
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
            echo 'Build réussi ! Le JAR est généré et archivé.'
        }
        failure {
            echo 'Échec du build – voir la console pour les erreurs.'
        }
    }
}