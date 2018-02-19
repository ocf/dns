pipeline {
  agent {
    label 'slave'
  }
  options {
    ansiColor('xterm')
    timeout(time: 1, unit: 'HOURS')
  }
  stages {
    stage('check-out-code') {
      steps {
        checkout scm
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
      steps {
        script {
          build job: 'puppet-trigger', parameters: [
            [$class: 'StringParameterValue', name: 'server', value: 'ns'],
          ]
        }
      }
    }
  }
  post {
    failure {
      emailNotification()
    }
    always {
      ircNotification()
    }
  }
}

// vim: ft=groovy
