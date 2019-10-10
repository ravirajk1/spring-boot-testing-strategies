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

        stage ('Package') {
            steps {
				bat 'mvn package'
			}
        }
		
        stage('Build Image') {
	      steps {
	        bat 'mvn dockerfile:build'
	      }
        }
       
        stage('Publish Image') {
	      steps {
	        bat 'mvn dockerfile:push'
	      }
        }
    }
}