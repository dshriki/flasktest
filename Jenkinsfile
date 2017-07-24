pipeline {
  agent {
    node {
      label 'docker-slave'
    }
    
  }
  stages {
    stage('build') {
      steps {
        parallel(
          "build": {
            sh '''./distrib.sh build
'''
            
          },
          "test_connection": {
            sh './distrib.sh test_connection'
            
          },
          "test": {
            sh 'echo "hello"'
            
          }
        )
      }
    }
    stage('setup') {
      steps {
        sh './distrib.sh copy'
        sh './distrib.sh extract'
      }
    }
  }
}