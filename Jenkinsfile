pipeline {
  agent {
    node {
      label 'docker-slave'
    }
    
  }
  stages {
    stage('build') {
      steps {
	    sh 'git clone https://github.com/dshriki/flasktest.git'
            sh 'pip3 install -r flasktest/flasktest/requirements.txt'
          }
      }
    stage('test') {
      steps {
        sh 'python3 flasktest/flasktest/run.py &'
        sh 'curl -f -I http://localhost:5555/'
      }
    }
  }
}
