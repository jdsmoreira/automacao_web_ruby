Dado("que acesso a página de login") do
  @login_page.goto_login
end

Quando("informo o email {string} para criar uma conta") do |email|
  @login_page.email_new_account(email)
end

Então("devo ver a mensagem {string}") do |expect_message|
  expect(@login_page.alert_new_account).to eql expect_message
end

Quando("submeto minhas credenciais com: {string} e {string}") do |email, password|
  @login_page.login(email, password)
end
