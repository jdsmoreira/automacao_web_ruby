class PaymentPage
  include Capybara::DSL

  def pay_by_bank
    click_on "Pay by bank wire"
  end

  def confirm_my_order
    click_on "I confirm my order"
  end
end
