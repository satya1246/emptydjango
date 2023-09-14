pipeline {
    agent any

    environment {
        AWS_REGION = 'us-east-1'
        AWS_ECR_REPO = '569994883643.dkr.ecr.us-east-1.amazonaws.com/satya'
        DOCKER_IMAGE_NAME = 'django-rest-api-books'
        // DOCKERFILE_PATH = '.'
    }
     stages {
        stage('getting source code ') {
            steps {
                // Checkout the code from your Git repository
                // Replace 'YOUR_GIT_REPO_URL' and 'YOUR_BRANCH' with your Git repo details
                // checkout([$class: 'GitSCM', branches: [[name: 'main']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/satya1246/djangoapi-project.git']]])
                git branch: 'main', credentialsId: '2440988f-0811-4435-87ab-27a398349a7d', url: 'https://github.com/satya1246/emptydjango.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                // Build the Docker image
                
               script{
                dockerImage = docker.build "${DOCKER_IMAGE_NAME}" '.'
                 "this stage successfully completed"
               }
            }
        }
        stage('Push to ECR') {
            steps {
                
                echo "entering into new stage"
                withAWS(region: "${AWS_DEFAULT_REGION}", credentials: '67adfc02-ddd0-49ec-8a8b-2374fbbe195e') {
                        // Authenticate Docker to ECR
                        sh "aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 569994883643.dkr.ecr.us-east-1.amazonaws.com"

                        // Tag the Docker image for ECR
                        sh "docker tag ${dockerimage} ${AWS_ECR_REPO}/${dockerimage}"

                        // Push the Docker image to ECR
                        sh "docker push ${AWS_ECR_REPO}/${dockerimage}"
                    }

            }
        }


    }
}
    

   

        

       

   
