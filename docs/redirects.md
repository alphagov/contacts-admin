# Redirecting contacts that have been removed already

Contacts Admin used to issue a “gone” item to Publishing API when a contact was deleted. But since [#838](https://github.com/alphagov/contacts-admin/pull/838), we issue a “redirect” instead.

If a contact was removed as a “gone” item and now needs to be redirected, we have a Rake task for this:

```
$ cd /var/apps/contacts
$ sudo -u deploy govuk_setenv contacts bundle exec rake contacts:replace_gone_with_redirect[removed-contact-slug,organisation-slug,path-to-redirect-to]
```

This will fail if either of the following are true:

1. `removed-contact-slug` references a contact object in the Contacts Admin database
2. the path constructed by `removed-contact-slug` and `organisation-slug` does not refer to a “gone” item in content store
