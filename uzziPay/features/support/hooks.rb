Before do
  @login_page = LoginPage.new
  @google_authenticator_page = GoogleAuthenticatorPage.new
  @realizar_transferencia_page = RealizarTransferenciaPage.new
  @menu_page = MenuPage.new
  @agendamento_page = AgendamentoPage.new
  @confirmar_aprovar_page = ConfirmarAprovarPage.new
  @dialog_page = DialogPage.new
  @historico_page = HistoricoPage.new
  @comprovante_page = ComprovantePage.new

  page.current_window.resize_to(1440, 900)
end

After do
  shot = page.save_screenshot("logs/temp_shot.png")

  Allure.add_attachment(
    name: "Screenshot",
    type: Allure::ContentType::PNG,
    source: File.open(shot),
  )
end
