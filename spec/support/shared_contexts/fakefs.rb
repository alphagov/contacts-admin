shared_context "with fakefs", with_fakefs: true do
  include FakeFS::SpecHelpers

  around do |example|
    FakeFS do
      example.run
    end
  end
end
