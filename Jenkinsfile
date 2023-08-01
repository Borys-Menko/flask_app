pipeline {
  agent {
    kubernetes {
      cloud 'node'
    
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