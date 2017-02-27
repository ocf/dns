try {
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

} catch (err) {
    def subject = "${env.JOB_NAME} - Build #${env.BUILD_NUMBER} - Failure!"
    def message = "${env.JOB_NAME} (#${env.BUILD_NUMBER}) failed: ${env.BUILD_URL}"

    if (env.BRANCH_NAME == 'master') {
        slackSend color: '#FF0000', message: message
        mail to: 'root@ocf.berkeley.edu', subject: subject, body: message
    } else {
        mail to: emailextrecipients([
            [$class: 'CulpritsRecipientProvider'],
            [$class: 'DevelopersRecipientProvider']
        ]), subject: subject, body: message
    }

    throw err
}


// vim: ft=groovy
