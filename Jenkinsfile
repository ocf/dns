pipeline {
  agent {
    label 'slave'
  }

  options {
    ansiColor('xterm')
    timeout(time: 1, unit: 'HOURS')
  }

  stages {
    stage('test') {
      steps {
        sh 'make test'
      }
    }

    stage('deploy') {
      when {
        branch 'master'
      }
      agent {
        label 'deploy'
      }
      steps {
        puppetTrigger('ns')
      }
    }
  }

  post {
    failure {
      emailNotification()
    }
    always {
      node {
        ircNotification()
      }
    }
  }
}

// vim: ft=groovy
