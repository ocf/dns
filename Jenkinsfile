// check out code
stage name: 'check-out-code'

node('slave') {
    dir('src') {
        checkout scm
    }
    stash 'src'
}


// run tests
stage name: 'test'

node('slave') {
    unstash 'src'
    dir('src') {
        sh 'make test'
    }
}


// deploy to prod
if (env.BRANCH_NAME == 'master') {
    stage name: 'deploy-to-prod'

    build job: 'puppet-trigger', parameters: [
        [$class: 'StringParameterValue', name: 'server', value: 'ns'],
    ]
}


// vim: ft=groovy
