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
        sh 'find /srv/dns \( -name "*.jbk" -o -name "*.signed*" \) -delete'
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
