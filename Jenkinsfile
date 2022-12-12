pipeline {
    agent any
    options {
        skipStagesAfterUnstable()
    }

environment {
        AWS_ECR_REGION = 'eu-west-1'
        AWS_ECS_SERVICE = 'challenge'
        AWS_ECS_TASK_DEFINITION = 'challenge-td'
        AWS_ECS_COMPATIBILITY = 'FARGATE'
        AWS_ECS_NETWORK_MODE = 'awsvpc'
        AWS_ECS_CPU = '256'
        AWS_ECS_MEMORY = '512'
        AWS_ECS_CLUSTER = 'sample-challenge'
        AWS_ECS_TASK_DEFINITION_PATH = './td.json'
        AWS_ECS_EXECUTION_ROL = 'ecsTaskExecutionRole'
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

	stage('Test'){
            steps {
                 echo 'Empty'
            }
        }
stage('Deploy in ECS') {
  steps {
      script {
	sh './td-script.sh'
}
}
}
}
}

