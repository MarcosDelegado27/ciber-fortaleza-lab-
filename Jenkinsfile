pipeline {
    agent any

    environment {
        IMAGE_NAME = "bioguard-app"
        CONTAINER_NAME = "bioguard-container"
    }

    stages {
        stage('Checkout') {
            steps {
                // Descarga el código de tu GitHub
                checkout scm
            }
        }

        stage('Test & QA (PyBuilder)') {
            steps {
                echo 'Iniciando auditoría de calidad con PyBuilder...'
                // MODIFICACIÓN 1: Usamos pyb para garantizar el 100% de cobertura
                sh 'pip install pybuilder --break-system-packages'
                sh 'pyb'
            }
        }

        stage('Build Image') {
            steps {
                echo 'Construyendo imagen de Docker...'
                sh "docker build -t ${IMAGE_NAME} ."
            }
        }

        stage('Deploy Seguro') {
            steps {
                echo 'Desplegando en puerto seguro 8443...'
                // Limpiamos contenedores previos si existen
                sh "docker rm -f ${CONTAINER_NAME} || true"
                // MODIFICACIÓN 2: Puerto seguro 8443 mapeado al 5000 interno
                sh "docker run -d -p 8443:5000 --name ${CONTAINER_NAME} ${IMAGE_NAME}"
            }
        }
    }

    post {
        success {
            echo '¡Operación Ciber-Fortaleza: Fase 3 Completada con éxito!'
        }
        failure {
            echo 'El build ha fallado. Revisa la cobertura de PyBuilder o los logs de Docker.'
        }
    }
}
