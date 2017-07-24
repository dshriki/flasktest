pipeline {
  agent any
  stages {
    stage('build') {
      steps {
        parallel(
          "build": {
            sh './distrib.sh build'
            
          },
          "test_connection": {
            sh './distrib.sh test_connection'
            
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