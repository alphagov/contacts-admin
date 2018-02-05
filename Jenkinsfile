#!/usr/bin/env groovy

node {
  def govuk = load '/var/lib/jenkins/groovy_scripts/govuk_jenkinslib.groovy'
  govuk.setEnvar("PUBLISHING_E2E_TESTS_COMMAND", "test-contacts-admin")
  govuk.buildProject(
    publishingE2ETests: true,
    sassLint: false,
    repoName: 'contacts-admin',
    beforeTest: {
      govuk.setEnvar('RUNNING_IN_CI', 'true')
    }
  )
}
