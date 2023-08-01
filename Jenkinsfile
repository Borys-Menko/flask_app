pipeline {
  agent {
    kubernetes {
      cloud 'node'
      label 'jenkins-jenkins-agent'
      defaultContainer 'jnlp'
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