pipeline {
    agent any
    options {
        skipStagesAfterUnstable()
    }
    stages {
         stage('Clone repository') { 
            steps { 
                script{
                checkout scm
                }
            }
        }

        stage('Build and Push images to ECR') {
        steps{
        script {
	  sh './ci-cd-pipeline/start.sh build'
	  sh 'docker images'
          sh './ci-cd-pipeline/start.sh push'
        }
      }
    }

	stage('Test'){
            steps {
                 echo 'Empty'
            }
        }
        
	stage('Deploy'){
            steps {
                 sh 'kubectl apply -f deployment.yml'
            }
        }
}
}
