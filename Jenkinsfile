pipeline {
  agent {
    label 'slave'
  }

  options {
    ansiColor('xterm')
    timeout(time: 1, unit: 'HOURS')
    timestamps()
  }

  stages {
    stage('check-gh-trust') {
      steps {
        checkGitHubAccess()
      }
    }

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
      node(label: 'slave') {
        ircNotification()
      }
    }
  }
}

// vim: ft=groovy
