class SummaryPage
  include Capybara::DSL

  def proceed_checkout
    click_on "Proceed to checkout"
  end
end
