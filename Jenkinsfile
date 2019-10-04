pipeline {
    agent any
	
	tools {
        maven 'Maven 3.3.9'
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
				sh 'mvn -B -DskipTests clean package'
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
    }
}