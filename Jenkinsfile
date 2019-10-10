 pipeline {
    agent any
	
	tools {
        maven 'apache-maven-3.6.0'
        jdk 'jdk1.8.0_191'
    }
     
    stages {
        stage ('Compile') {
		    steps {
				sh 'mvn clean compile'
			}
        }

        stage ('Build') {
            steps {
				sh 'mvn -B -DskipTests clean install'
			}
        }
		
		stage('Test') {
			steps {
					sh 'mvn test'
			}
			post {
				always {
					junit 'target/surefire-reports/*.xml'
				}
			}
            
        }
       
        stage('Build Image') {
	      steps {
	        sh 'mvn dockerfile:build'
	      }
        }
       
        stage('Publish Image') {
	      steps {
	        sh 'mvn dockerfile:push'
	      }
        }
    }
}