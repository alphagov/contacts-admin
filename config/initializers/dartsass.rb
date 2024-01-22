Rails.application.config.dartsass.builds = {
  "admin.scss" => "application.css",
}

Rails.application.config.dartsass.build_options << " --quiet-deps"
