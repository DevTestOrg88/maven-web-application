pipeline{

agent any

tools{
maven 'maven3.8.2'

}

triggers{
pollSCM('* * * * *')
}

options{
timestamps()
buildDiscarder(logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '5', daysToKeepStr: '', numToKeepStr: '5'))
}

stages{

  stage('CheckOutCode'){
    steps{
    git branch: 'development', credentialsId: '957b543e-6f77-4cef-9aec-82e9b0230975', url: 'https://github.com/devopstrainingblr/maven-web-application-1.git'
	
	}
  }
  
  stage('Build'){
  steps{
  sh  "mvn clean package"
  }
  }
/*
 stage('ExecuteSonarQubeReport'){
  steps{
  sh  "mvn clean sonar:sonar"
  }
  }
  
  stage('UploadArtifactsIntoNexus'){
  steps{
  sh  "mvn clean deploy"
  }
  }
  
  stage('DeployAppIntoTomcat'){
  steps{
  sshagent(['bfe1b3c1-c29b-4a4d-b97a-c068b7748cd0']) {
   sh "scp -o StrictHostKeyChecking=no target/maven-web-application.war ec2-user@35.154.190.162:/opt/apache-tomcat-9.0.50/webapps/"    
  }
  }
  }
  */
}//Stages Closing

post{

 success{
 emailext to: 'devopstrainingblr@gmail.com,mithuntechnologies@yahoo.com',
          subject: "Pipeline Build is over .. Build # is ..${env.BUILD_NUMBER} and Build status is.. ${currentBuild.result}.",
          body: "Pipeline Build is over .. Build # is ..${env.BUILD_NUMBER} and Build status is.. ${currentBuild.result}.",
          replyTo: 'devopstrainingblr@gmail.com'
 }
 
 failure{
 emailext to: 'devopstrainingblr@gmail.com,mithuntechnologies@yahoo.com',
          subject: "Pipeline Build is over .. Build # is ..${env.BUILD_NUMBER} and Build status is.. ${currentBuild.result}.",
          body: "Pipeline Build is over .. Build # is ..${env.BUILD_NUMBER} and Build status is.. ${currentBuild.result}.",
          replyTo: 'devopstrainingblr@gmail.com'
 }
 
}


}//Pipeline closing

// Below code written by Rajdeep to deploy war to Tomcat server
/*

pipeline {
    agent any
    tools {
  maven 'mavenversion3.9.10'
}
triggers {
  githubPush()
}
parameters {
  choice choices: ['master', 'dev', 'stage'], description: 'build with parameter', name: 'branchName'
}
stages {
  stage('CheckoutCode') {
    steps {
      // One or more steps need to be included within the steps block.
      git branch: "${params.branchName}", url: 'https://github.com/DevTestOrg88/maven-web-application.git'
    }
  }
  stage('Build') {
    steps {
      // One or more steps need to be included within the steps block.
      sh 'mvn clean install'
    }
  }
//Used Snippet Generator with 'Deploy comtainer plugin ' under sample steps and converted to Declarative way scipt using chartGpt
  stage('Deploy to Tomcat') {
            steps {
                step([$class: 'DeployPublisher',
                    adapters: [
                        [$class: 'Tomcat9xAdapter',
                         credentialsId: '4aff5716-dda4-4c4f-8dff-d14020358397',
                         url: 'http://13.126.90.62-61:9090/manager/text',
                         path: '',
                         alternativeDeploymentContext: ''
                        ]
                    ],
                    contextPath: '/maven-web-application',
                    war: '**/maven-web-application.war'
                ])
            }
        }
}
// To ensure notifications (like email) run regardless of earlier failures
    post {
            always {
                emailext (
                    attachLog: true,
                    body: 'Check console output at $BUILD_URL to view the results.',
                    subject: '$PROJECT_NAME - Build # $BUILD_NUMBER - $BUILD_STATUS!',
                    to: 'rajdeeprm88@gmail.com'
                )
            }
        }
}
*/
