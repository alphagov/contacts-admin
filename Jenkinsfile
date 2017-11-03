#!/usr/bin/env groovy

node {
  def govuk = load '/var/lib/jenkins/groovy_scripts/govuk_jenkinslib.groovy'
  govuk.buildProject(
    sassLint: false,
    repoName: 'contacts-admin',
    beforeTest: {
      govuk.setEnvar('RUNNING_IN_CI', 'true')
    }
  )
}
