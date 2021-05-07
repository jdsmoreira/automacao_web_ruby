Dado("que o usuário tenha acessado o menu Transferências > Realizar") do
  @login_page.go
  @login_page.login_with("851.964.465-16", "rovema2020")
  @google_authenticator_page.set_token_login(get_token)
  @google_authenticator_page.continuar_click

  @menu_page.realizar_transferencia_click
end

Dado("que selecione a opção de transferência {string}") do |opcao|
  @realizar_transferencia_page.transferencia_para(opcao)
end

Dado("informe os dados do favorecido") do
  @realizar_transferencia_page.seleciona_banco("Nu Pagamentos S.A.")
  @realizar_transferencia_page.agencia.set "0001"
  @realizar_transferencia_page.conta.set "3190429-6"
  @realizar_transferencia_page.cpf_cnpj.set "03211498150"
  @realizar_transferencia_page.seleciona_tipo_conta("CONTA CORRENTE").click
  @realizar_transferencia_page.nome_favorecido.set "JEFERSON DUARTE SOUZA MOREIRA"
  @realizar_transferencia_page.valor_da_transferencia.set "0,09"
  @realizar_transferencia_page.identificacao_da_transferencia.set "TED - Nubank"
end

Dado("continue a transferência") do
  click_button "Continuar"
end

Quando("agendado o pagamento para a data {string}") do |data|
  click_button "Agendar Transferência"
  @agendamento_page.set_data(data)
  click_button "AGENDAR"
end

Então("deve ser direcionado para tela de Confirmar agendamento") do
  #expect(page).to have_current_path("transfers/approve-schedule/")
  expect(page).to have_css("span", :text => "CONFIRMAR AGENDAMENTO")
  expect(page).to have_button("Confirmar Agendamento")
end

Então("deve listar a transferência") do
  expect(@confirmar_aprovar_page.get_registro_table("1", "1")).to eql "JEFERSON DUARTE SOUZA MOREIRA"
  expect(@confirmar_aprovar_page.get_registro_table("1", "2")).to eql "260 - NU PAGAMENTOS S.A."
  expect(@confirmar_aprovar_page.get_registro_table("1", "3")).to eql "0001/3190429-6"
  expect(@confirmar_aprovar_page.get_registro_table("1", "4").strip).to eql "0,09"
end

Dado("informe os dados da conta UzzyPay") do
  @realizar_transferencia_page.cpf_cnpj.set "09.313.969/0001-97"
  @realizar_transferencia_page.valor_da_transferencia_entre_contas_uzzipay.set "0,10"
  @realizar_transferencia_page.identificacao_da_transferencia_entre_contas_uzzipay.set "TRANSFERÊNCIA ENTRE CC UZZYPAY"
end

Então("deve listar a transferência para conta UzzyPay") do
  expect(@confirmar_aprovar_page.get_registro_table_por_texto("AUTOPISTA LITORAL SUL S.A.", "1")).to eql "AUTOPISTA LITORAL SUL S.A."
  expect(@confirmar_aprovar_page.get_registro_table_por_texto("AUTOPISTA LITORAL SUL S.A.", "2")).to eql "UZZIPAY"
  expect(@confirmar_aprovar_page.get_registro_table_por_texto("AUTOPISTA LITORAL SUL S.A.", "3")).to eql "-"
  expect(@confirmar_aprovar_page.get_registro_table_por_texto("AUTOPISTA LITORAL SUL S.A.", "4").strip).to eql "0,10"
end

Dado("informe o tipo de conta {string}") do |tipo|
  @realizar_transferencia_page.seleciona_tipo_conta(tipo).click
end

Quando("informado o banco {string}") do |banco|
  @realizar_transferencia_page.banco.set ""
  @realizar_transferencia_page.seleciona_banco(banco)
end

Então("deve aviso de transferência para conta do tipo poupança não permitido para o banco {string}") do |banco|
  expect(@realizar_transferencia_page.message).to eql "TRANSFERÊNCIA PARA CONTA TIPO POUPANÇA DO #{banco} ESTÁ INDISPONÍVEL"
end

Então("apresentar desabilitada a opção {string} no campo tipo") do |opcao|
  @realizar_transferencia_page.tipo_conta.click
  expect(page).to have_xpath("//nb-option[.='CONTA POUPANÇA - INDISPONÍVEL'][@disabled]")
end

Dado("adicione uma nova transferência") do
  @realizar_transferencia_page.nova_transferencia_click
  @realizar_transferencia_page.cpf_cnpj.set "47.379.565/0071-06"
  @realizar_transferencia_page.valor_da_transferencia_entre_contas_uzzipay.set "0,11"
  @realizar_transferencia_page.identificacao_da_transferencia_entre_contas_uzzipay.set "TRANSFERÊNCIA PJ ENTRE CC UZZYPAY"
  @realizar_transferencia_page.continuar_click
end

Então("deve listar as transferências em lote") do
  steps %(
    E deve listar a transferência para conta UzzyPay
  )
  expect(@confirmar_aprovar_page.get_registro_table_por_texto("PROXXI TECNOLOGIA LTDA.", "1")).to eql "PROXXI TECNOLOGIA LTDA."
  expect(@confirmar_aprovar_page.get_registro_table_por_texto("PROXXI TECNOLOGIA LTDA.", "2")).to eql "UZZIPAY"
  expect(@confirmar_aprovar_page.get_registro_table_por_texto("PROXXI TECNOLOGIA LTDA.", "3")).to eql "-"
  expect(@confirmar_aprovar_page.get_registro_table_por_texto("PROXXI TECNOLOGIA LTDA.", "4").strip).to eql "0,11"
end

Quando("excluir primeira transferência") do
  @realizar_transferencia_page.remove_transferencia_por_texto("AUTOPISTA LITORAL SUL S.A.")
end

Quando("confirmar a exclusão da transferência") do
  @dialog_page.sim_click
end

Então("deve listar apenas a segunda tranfêrencia") do
  expect(page).to have_no_xpath("//div[@class='transfer-box']//dd[contains(text(), 'AUTOPISTA LITORAL SUL S.A.')]/../../../button[@class='transfer-remove']")
  expect(page).to have_xpath("//button[@class='transfer-remove']")
end
