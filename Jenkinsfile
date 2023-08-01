pipeline {
  agent {
    kubernetes {
      cloud 'node'
      inheritFrom 'default'
      label 'jenkins-jenkins-agent'
    }
  }
  stages {
    stage('Run maven') {
      steps {
        container('python') {
          sh 'python --version'
        }

      }
    }
  }
}