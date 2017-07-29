pipeline {
  agent {
    node {
      label 'docker-slave-cli'
    }
    
  }
  stages {
    stage('build') {
      steps {
        sh 'docker build -t hello:0.0.1 .'
      }
    }
    stage('test') {
      steps {
        parallel(
          "test": {
            sh 'docker run -d --network=build-network --ip=172.25.1.1 --name hello hello:0.0.1'
            
          },
          "error": {
            sh 'docker ps'
            sleep 10
            sh 'curl -I -f http://172.25.1.1:5555'
            sh 'docker stop hello'
            sh 'docker rm hello'
            
          }
        )
      }
    }
    stage('deploy') {
      steps {
        sh 'docker run -d --network=build-network --ip=172.25.1.1 --name hello hello:0.0.1'
      }
    }
    stage('prod-test') {
      steps {
        sh 'curl -I -f http://172.25.1.1:5555'
      }
    }
  }
}