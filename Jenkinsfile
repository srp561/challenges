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
	  sh './start.sh build'
          sh './start.sh push'
        }
      }
    }

	 }
 }  


