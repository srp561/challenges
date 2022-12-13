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
	  sh 'aws ecr batch-delete-image --repository-name challenges --image-ids imageTag=latest'
          sh './start.sh push'
        }
      }
    }

<<<<<<< HEAD
	 }
 }  


=======
	stage('Test'){
            steps {
                 echo 'Empty'
            }
        }
        
	stage('Deploy'){
            steps {
                 sh 'kubectl apply -f deployment.yml --context challenges-cluster'
		 sh 'kubectl rollout restart deployment challenges'
            }
        }
}
}
>>>>>>> parent of f619bbb... Updated
