pipeline {
  agent {
    node {
      label 'docker-slave-cli'
    }
    
  }
  stages {
    stage('build') {
	steps{
	sh 'mkdir test-slave'
	}	
      }
    }
}
