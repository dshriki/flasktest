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
        sh 'docker run -d --network=build-network --ip=172.18.0.5 --name hello hello:0.0.1'
        sh 'curl -I -f http://172.18.0.5:5555'
        sh 'docker kill hello'
        sh 'docker rm hello'
      }
    }
    stage('deploy') {
      steps {
        sh 'docker run -d --network=build-network --ip=172.18.0.5 --name hello hello:0.0.1'
      }
    }
    stage('prod-test') {
      steps {
        sh 'curl -I -f http://172.18.0.5:5555'
      }
    }
  }
}