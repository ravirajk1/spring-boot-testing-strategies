 pipeline {
    agent any
	
	tools {
        maven 'apache-maven-3.6.0'
        jdk 'jdk1.8.0_191'
    }
     
    stages {
        stage ('Compile') {
		    steps {
				bat 'mvn clean compile'
			}
        }

        stage ('Build') {
            steps {
				bat 'mvn -B -DskipTests clean install'
			}
        }
		
		stage('Test') {
			steps {
					bat 'mvn test'
			}
			post {
				always {
					junit 'target/surefire-reports/*.xml'
				}
			}
            
        }
       
        stage('Build and Publisg Docker Image') {
	      steps {
	        bat 'mvn package dockerfile:build -DpushImage'
	      }
        }
    }
}