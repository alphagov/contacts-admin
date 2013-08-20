module FeaturesHelpers
  def verify(call)
    expect(call).to be_true
  end

  def refute(call)
    expect(call).to be_false
  end

  def dom_id_for(*args)
    ActionView::RecordIdentifier.dom_id(*args)
  end

  def dom_id_selector(*args)
    "##{dom_id_for(*args)}"
  end
end
