Before do
  @login_page = LoginPage.new
  @cadastro_page = CadastroPage.new
  @initial_page = InitialPage.new
  @product_page = ProductPage.new
  @cart_page = CartPage.new
  @summary_page = SummaryPage.new
  @address_page = AddressPage.new
  @shipping_page = ShippingPage.new
  @payment_page = PaymentPage.new
  @layer_cart_page = LayerCartPage.new

  page.driver.browser.manage.window.maximize
  #page.current_window.resize_to(1440, 900)
end

After do
  shot = page.save_screenshot("logs/temp_shot.png")

  Allure.add_attachment(
    name: "Screenshot",
    type: Allure::ContentType::PNG,
    source: File.open(shot),
  )
end
