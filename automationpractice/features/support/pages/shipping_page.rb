class ShippingPage
  include Capybara::DSL

  def checked_terms
    check ("cgv"), allow_label_click: true
  end
end
