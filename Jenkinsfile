pipeline {
  agent any
  
  environment {
    //API_KEY = credentials('AIzaSyCufNpGA1BRPkBWt0VWmMwVvoEbkaSdvYA')
    //DATABASE_URL = credentials('35.246.177.84')
    IMAGE_TAG = "${env.BUILD_NUMBER}"
  }
  
  stages {

    stage('Checkout') {
      steps {
        // Cloning the repository into the workspace
        git branch: 'main', url: 'https://github.com/Ryuuramaru/webapp.git'
      }
    }

    stage('Build') {
      steps {
        // Install dependencies and build the web app
        dir('webapp') {
          sh 'npm install'
          sh 'npm run build'
          }
        }
        
        // Optionally, you can run tests here
        //sh 'npm test'
      }
    
    stage('Containerize') {
      steps {
        
        // Build the Docker image for the web app
        sh "docker build -t webapp:${IMAGE_TAG} ./webapp"
      }
    }

    stage('Push to Registry') {
      steps {
        // Push the Docker image to the registry
        sh 'docker tag webapp:${IMAGE_TAG} gcr.io/metal-filament-395208/webapp:${IMAGE_TAG}'
        sh 'docker push gcr.io/metal-filament-395208/webapp:${IMAGE_TAG}'
      }
    }

    stage('Deploy') {
      steps {
        sh "ansible-playbook -i ansible/hosts playbook.yaml -e image_tag=${env.BUILD_NUMBER}"
      }
    }  
  }
}

