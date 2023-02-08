pipeline {
    agent any
    
    stages{
       stage('GetCode'){
            steps{
               git 'https://github.com/Patilgit/Terra-eks-demo.git'
            }
         }        
       stage('Build'){
            steps{
                sh 'mvn clean install'
            }
        }
        stage('create eks from terraform'){
        steps{
            sh 'terraform init'
            sh 'terraform apply'
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

