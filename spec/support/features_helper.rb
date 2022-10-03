module FeaturesHelpers
  def verify(call)
    expect(call).to be_truthy
  end

  def refute(call)
    expect(call).to be_falsey
  end
end
