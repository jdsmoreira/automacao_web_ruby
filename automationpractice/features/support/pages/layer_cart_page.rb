class LayerCartPage
  include Capybara::DSL

  def proceed_checkout
    click_on "Proceed to checkout"
  end

  def continue_shopping
    find(:xpath, "//span[@title='Continue shopping']").click
  end
end
