unless Rails.env.production?
  require "rubocop/rake_task"

  RuboCop::RakeTask.new(:lint) do |t|
    t.patterns = %w(app config Gemfile lib spec)
    t.formatters = %w(clang)
    t.options = %w(--parallel)
  end
end
