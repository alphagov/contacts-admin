#!/usr/bin/env groovy

library("govuk")

node {
  govuk.setEnvar("PUBLISHING_E2E_TESTS_COMMAND", "test-contacts-admin")
  govuk.setEnvar("PUBLISHING_E2E_TESTS_APP_PARAM", "CONTACTS_ADMIN_COMMITISH")
  govuk.buildProject(
    publishingE2ETests: true,
    repoName: 'contacts-admin',
    brakeman: true,
  )
  // Run against the MySQL 8 Docker instance on GOV.UK CI
  govuk.setEnvar("TEST_DATABASE_URL", "mysql2://root:root@127.0.0.1:33068/contacts_test")
}
