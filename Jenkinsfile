pipeline {
  agent {
    node {
      label 'docker-slave'
    }
    
  }
  stages {
    stage('build') {
      steps {
<<<<<<< HEAD
	   
	    sh 'git clone https://github.com/dshriki/flasktest.git'
            sh 'pip3 install -r flasktest/flasktest/requirements.txt'
          }
        
      
=======
        sh 'git clone https://github.com/dshriki/flasktest.git'
        sh 'pip3 install -r flasktest/flasktest/requirements.txt'
      }
>>>>>>> 4f15e44c761bd75ecb640e081c9efcd024d73ed0
    }
    stage('test') {
      steps {
        sh 'python3 flasktest/flasktest/run.py &'
        sh 'curl -f -I http://localhost:5555/'
      }
    }
  }
}
