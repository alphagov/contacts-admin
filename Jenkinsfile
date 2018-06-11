#!/usr/bin/env groovy

library("govuk")

node {
  govuk.setEnvar("PUBLISHING_E2E_TESTS_COMMAND", "test-contacts-admin")
  govuk.buildProject(
    publishingE2ETests: true,
    rubyLintDiff: false,
    sassLint: false,
    repoName: 'contacts-admin',
    beforeTest: {
      govuk.setEnvar('RUNNING_IN_CI', 'true')
    }
  )
}
