pipeline {
  agent any
    stages {

  stage ('Checkout SCM'){
        steps {
          checkout([$class: 'GitSCM', branches: [[name: '*/main']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'Git', url: '']]])
      }
   }
	  //Build stage
	stage ('Build')  {
	    steps {
        dir('my-new-app/ClientApp'){
            sh "npm install"
          }
        }    
   }
      stage ('Deploy')  {
	    steps {
        dir('my-new-app/ClientApp'){
		
		sh "npm run build"
		//sh "npm audit fix --force"
          }
        }    
   }
	    stage('Upload to AWS') {
              steps {
                  withAWS(region:'us-east-2',credentials:'s3-bucket') {
                  sh 'echo "Uploading content with AWS creds"'
                      s3Upload(pathStyleAccessEnabled: true, payloadSigningEnabled: true, file:'ClinetApp/dist', bucket:'poc-dsg')
                  }
              }
         }
      
    }
}
