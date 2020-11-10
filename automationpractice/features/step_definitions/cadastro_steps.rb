Então("devo ser redirecionado para o formulário de cadastro") do
  expect(page).to have_css "#account-creation_form"
end

Quando("submeto o formulário com os dados:") do |table|
  user = table.rows_hash

  @cadastro_page.personal_information(user[:title], user[:first_name], user[:last_name], user[:password],
                                      user[:day_birth], user[:month_birth], user[:year_birth])

  @cadastro_page.address_information(user[:address_first_name], user[:address_last_name], user[:company], user[:address],
                                     user[:address2], user[:city], user[:state], user[:zip], user[:country], user[:add_inf],
                                     user[:home_phone], user[:mobile_phone], user[:address_reference])
  @cadastro_page.register
end

Então("devo ser redirecionado para areá da minha conta") do
  expect(find(".info-account").text).to eql "Welcome to your account. Here you can manage all of your personal information and orders."
end
