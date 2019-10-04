pipeline {
    agent any

    stages {
        stage ('Compile') {
		    withMaven(maven : 'apache-maven-3.6.0'){
				steps {
					sh 'mvn clean compile'
				}
            }
        }

        stage ('Build') {
            withMaven(maven : 'apache-maven-3.6.0'){
				steps {
					sh 'mvn -B -DskipTests clean package'
				}
            }
        }
		
		stage('Test') {
			withMaven(maven : 'apache-maven-3.6.0'){
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
}