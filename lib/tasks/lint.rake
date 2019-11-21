desc "Run rubocop with similar params to CI"
task "lint" do
  sh "bundle exec rubocop --format clang app config Gemfile lib spec"
end
