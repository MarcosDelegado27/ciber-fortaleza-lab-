pipeline {
    agent any

    stages {
        stage('Checkout (Ingredientes)') {
            steps {
                echo 'Descargando el código de BioGuard Project...'
                checkout scm
            }
        }

        stage('Build (Cocinar)') {
            steps {
                echo 'Cocinando la imagen Docker de la aplicación...'
                // Se construye la imagen con el nombre del nuevo proyecto
                sh 'docker build -t bioguard-app .'
            }
        }

        stage('Test (Control de Calidad)') {
            steps {
                echo 'Ejecutando auditoría de calidad con PyBuilder...'
                // MODIFICACIÓN CISO: Se cambia 'python test.py' por 'pyb' 
                // para usar el motor de PyBuilder de la Fase 2
                sh 'docker run --rm bioguard-app pyb'
            }
        }

        stage('Deploy (Entrega)') {
            steps {
                echo 'Desplegando en Producción segura...'
                sh 'docker rm -f bioguard-prod || true'
                // MODIFICACIÓN CISO: Se cambia el puerto de -p 5000:5000 a -p 8443:5000
                sh 'docker run -d --name bioguard-prod -p 8443:5000 bioguard-app'
                echo '¡Sistema desplegado en puerto seguro: http://localhost:8443!'
            }
        }
    }

    post {
        always {
            echo 'Limpiando el entorno de construcción...'
            sh 'docker image prune -f'
        }
        success {
            echo '🎉 ¡Operación Ciber-Fortaleza: Pipeline completado con éxito!'
        }
        failure {
            echo '🚑 ¡ALERTA DE SEGURIDAD! El pipeline ha fallado. Revisa los tests de PyBuilder.'
        }
    }
}
