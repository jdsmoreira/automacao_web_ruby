Dado("que acesso a página de cadastro") do
  goto_register
end

Quando("submeto o meu cadastro com:") do |table|
  user = table.rows_hash

  remove_user(user[:email])

  register_with(user[:email], user[:senha], user[:senha_confirma])

  # find("input[name*=email]").set user[:email]
  # find("input[placeholder='Sua senha secreta']").set
  # find("input[placeholder='Confirme a senha']").set

  # click_on "Cadastrar"
end

Então("devo ser redirecionado para a área logada") do
  expect(page).to have_css ".dashboard"
end

Então("devo ver a mensagem: {string}") do |expect_message|
  # alert = find(".message p")
  # expect(alert.text).to eql expect_message
  expect(register_alert).to eql expect_message
end

#dynamic Step como chamar um step dentro de outro
Quando("acesso a página de cadastro") do
  steps %(
    Dado que acesso a página de cadastro
  )
end

Então("deve exibir o seguinte css {string}") do |expect_css|
  expect(page).to have_css expect_css
end
