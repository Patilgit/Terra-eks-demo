pipeline {
    agent any
    
    stages{
       stage('GetCode'){
            steps{
                git branch: 'main', credentialsId: '40f7a21f-6ce7-4bc0-b115-4a85ab05b062', url: 'https://github.com/Patilgit/demo.git'
            }
         }        
       stage('Build'){
            steps{
                sh 'mvn clean install'
            }
        }
          stage('Docker Build and Push') {
      steps {
      	withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
        	sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
            sh 'chmod 777 automate.sh'
            sh './automate.sh'
        }
      }
           }
             stage ("kubernetes deployment") {
                steps{
                  sh 'kubectl apply -f deployment_demo.yml'
                }
    }
         }
            
    }

