User.new { |u|
  u.name = 'Winston'
  u.uid = 'winston'
  u.version = 1
  u.email = 'winston@alphagov.co.uk'
  u.permissions = ['signin']
}.save

ContactGroup.find_or_create { |cg|
  cg.contact_group_type_id = ContactGroupType.most_popular
  cg.title = 'Change of details'
  cg.description = 'Get an estimate of how much tax you may need'
}

ContactGroup.find_or_create { |cg|
  cg.contact_group_type_id = ContactGroupType.most_popular
  cg.title = 'Tax'
  cg.description = 'Get an estimate of how much tax you may need'
}

ContactGroup.find_or_create { |cg|
  cg.contact_group_type_id = ContactGroupType.most_popular
  cg.title = 'Tax credits and other benefits'
  cg.description = 'Get an estimate of how much tax you may need'
}

ContactGroup.find_or_create { |cg|
  cg.contact_group_type_id = ContactGroupType.most_popular
  cg.title = 'VAT, Customs, Excise duties'
  cg.description = 'Get an estimate of how much tax you may need'
}

ContactGroup.find_or_create { |cg|
  cg.contact_group_type_id = ContactGroupType.for_individuals
  cg.title = 'National Insurance'
  cg.description = 'Get an estimate of how much tax you may need'
}

ContactGroup.find_or_create { |cg|
  cg.contact_group_type_id = ContactGroupType.for_individuals
  cg.title = 'Employers'
  cg.description = 'Get an estimate of how much tax you may need'
}

ContactGroup.find_or_create { |cg|
  cg.contact_group_type_id = ContactGroupType.for_individuals
  cg.title = 'Income Tax'
  cg.description = 'Get an estimate of how much tax you may need'
}

ContactGroup.find_or_create { |cg|
  cg.contact_group_type_id = ContactGroupType.for_individuals
  cg.title = 'Self Assessment'
  cg.description = 'Get an estimate of how much tax you may need'
}

ContactGroup.find_or_create { |cg|
  cg.contact_group_type_id = ContactGroupType.for_individuals
  cg.title = 'National Insurance'
  cg.description = 'Get an estimate of how much tax you may need'
}

ContactGroup.find_or_create { |cg|
  cg.contact_group_type_id = ContactGroupType.for_individuals
  cg.title = 'Child Benefit'
  cg.description = 'Get an estimate of how much tax you may need'
}

ContactGroup.find_or_create { |cg|
  cg.contact_group_type_id = ContactGroupType.for_individuals
  cg.title = 'Corporation Tax'
  cg.description = 'Get an estimate of how much tax you may need'
}

ContactGroup.find_or_create { |cg|
  cg.contact_group_type_id = ContactGroupType.for_individuals
  cg.title = 'Construction Industry Scheme (CIS)'
  cg.description = 'Get an estimate of how much tax you may need'
}

ContactGroup.find_or_create { |cg|
  cg.contact_group_type_id = ContactGroupType.for_individuals
  cg.title = 'Self Employed'
  cg.description = 'Get an estimate of how much tax you may need'
}

ContactGroup.find_or_create { |cg|
  cg.contact_group_type_id = ContactGroupType.for_individuals
  cg.title = 'Charities & clubs'
  cg.description = 'Get an estimate of how much tax you may need'
}

ContactGroup.find_or_create { |cg|
  cg.contact_group_type_id = ContactGroupType.for_individuals
  cg.title = 'Bereavement'
  cg.description = 'Get an estimate of how much tax you may need'
}
