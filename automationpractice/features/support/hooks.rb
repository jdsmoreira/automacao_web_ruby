Before do
  @login_page = LoginPage.new
  @cadastro_page = CadastroPage.new
end

After do
  shot = page.save_screenshot("logs/temp_shot.png")

  Allure.add_attachment(
    name: "Screenshot",
    type: Allure::ContentType::PNG,
    source: File.open(shot),
  )
end
