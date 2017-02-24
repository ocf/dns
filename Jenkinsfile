node('slave') {
    stage('check-out-code') {
        dir('src') {
            checkout scm
        }
    }

    stage('test') {
        dir('src') {
            sh 'make test'
        }
    }

    if (env.BRANCH_NAME == 'master') {
        stage('deploy-to-prod') {
            build job: 'puppet-trigger', parameters: [
                [$class: 'StringParameterValue', name: 'server', value: 'ns'],
            ]
        }
    }
}

// vim: ft=groovy
