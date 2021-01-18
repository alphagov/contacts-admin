#!/usr/bin/env groovy

library("govuk")

node {
  govuk.setEnvar("PUBLISHING_E2E_TESTS_COMMAND", "test-contacts-admin")
  govuk.setEnvar("PUBLISHING_E2E_TESTS_APP_PARAM", "CONTACTS_ADMIN_COMMITISH")
  govuk.buildProject(
    publishingE2ETests: true,
    repoName: 'contacts-admin',
    beforeTest: {
      govuk.setEnvar('RUNNING_IN_CI', 'true')
    },
    brakeman: true,
  )
}
