Dado("Login com {string} e {string}") do |email, password|
  @login_page.goto_login
  @login_page.login(email, password)
end

Dado("que vou comprar um vestido") do
  @initial_page.click_dresses_cat
  @initial_page.select_dresses_yellow
end

Dado("adiciono um vestido ao carrinho") do
  @product_page.add_dress_cart
end

Dado("prossigo com o pedido") do
  @layer_cart_page.proceed_checkout
  @summary_page.proceed_checkout
end

Dado("vou para a verificação do carrinho") do
  @layer_cart_page.proceed_checkout
end

Dado("escolho o metodo de entrega") do
  @summary_page.proceed_checkout
  @shipping_page.checked_terms
  @summary_page.proceed_checkout
end

Quando("confirmo este pagamento") do
  @payment_page.pay_by_bank
  @payment_page.confirm_my_order
end

Então("vejo que foi realizado o pedido com sucesso") do
  expect(page).to have_css("p", text: "Your order on My Store is complete.")
end

Quando("adiciono uma blusa") do
  @layer_cart_page.continue_shopping
  @initial_page.click_woman_cat
  @initial_page.select_blouse
end

Então("vejo o meu carrinho com o itens adicionados:") do |table|
  result = @cart_page.item_tr(table.hashes[0]["item"])
  expect(result).to have_text table.hashes[0]["item"]
  expect(result).to have_text table.hashes[0]["qtde"]
  expect(result).to have_text table.hashes[0]["total"]
end

Então("com totalizadores:") do |table|
  expect(@cart_page.total_prod).to eql table.hashes[0]["total_prod"]
  expect(@cart_page.total_ship).to have_text table.hashes[0]["total_ship"]
  expect(@cart_page.total_whihout_tax).to have_text table.hashes[0]["total"]
  expect(@cart_page.total_tax).to have_text table.hashes[0]["tax"]
  expect(@cart_page.total).to have_text table.hashes[0]["total"]
end
