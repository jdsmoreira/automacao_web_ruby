Dado("que estou na página de login da Uzzipay") do
  @login_page.go
  expect(page).to have_current_path("/login")
end

Dado("submeto minhas credenciais com: {string} e {string}") do |user, password|
  @login_page.login_with(user, password)
end

Dado("informo o token de acesso") do
  @google_authenticator_page.set_token_login(get_token)
end

Quando("confirmo o token") do
  @google_authenticator_page.continuar_click
end

Então("deve apresentar a tela inicial") do
  expect(page).to have_current_path("/home")
end

Então("deve apresentar o alerta {string}") do |expect_alert|
  expect(@login_page.alert).to eql expect_alert
end

Então("a mensagem de erro {string}") do |expect_message|
  expect(@login_page.error_message).to eql expect_message
end

Dado("informo o token de inválido") do
  @google_authenticator_page.set_token_login("999999")
end

Então("deve apresentar o alerta de token inválido {string}") do |expect_alert|
  expect(@google_authenticator_page.alert).to eql expect_alert
end

Então("deve permanecer na página de token") do
  expect(page).to have_css("form#totpForm")
end
