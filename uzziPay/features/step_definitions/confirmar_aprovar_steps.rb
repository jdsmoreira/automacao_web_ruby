Dado("que foi realizado o agendamento de uma transferência") do
  steps %(
    Dado que selecione a opção de transferência "TED"
    E informe os dados do favorecido
    E continue a transferência
    Quando agendado o pagamento para a data "data atual"
  )
end

Dado("que foi realizado o agendamento de transferências em lote") do
  steps %(
    Dado que selecione a opção de transferência "TED"
    E informe os dados do favorecido
    E continue a transferência
    E adicione uma nova transferência
    Quando agendado o pagamento para a data "data atual"
  )
end

Dado("que o usuário esta na tela de Confirmar agendamento") do
  expect(page).to have_css("span", :text => "CONFIRMAR AGENDAMENTO")
  expect(page).to have_button("Confirmar Agendamento")
end

Quando("confirmado do agendamento") do
  @confirmar_aprovar_page.confirmar_aprovar_click
end

Quando("informado o token de autenticação") do
  @google_authenticator_page.set_token(get_token)
  @google_authenticator_page.continuar_click
  sleep 2
end

Então("deve apresentar aviso de transferência agendada") do
  expect(@dialog_page.get_titulo_mensagem).to eql "TRANSFERÊNCIA AGENDADA"
  expect(@dialog_page.get_texto_mensagem).to eql "LEMBRE-SE, É NECESSÁRIO\nQUE A TRANSFERÊNCIA SEJA APROVADA"
  @dialog_page.ok_click
end

Então("deve apresentar a tela de histórico") do
  expect(page).to have_current_path("/transfers/search")
end

Então("deve apresentar o agendamento com status {string}") do |status|
  expect(@historico_page.get_registro_table("1", "4").text).to eql status
end

Quando("cancelado do agendamento") do
  @confirmar_aprovar_page.cancelar_reprovar_click
end

Quando("confirmado o cancelamento do agendamento") do
  expect(@dialog_page.get_titulo_mensagem).to eql "CANCELAR AGENDAMENTO"
  expect(@dialog_page.get_texto_mensagem).to eql "O LOTE DE TRANSFERÊNCIA SERÁ CANCELADO.\nTEM CERTEZA QUE VOCÊ QUER PROSSEGUIR?"
  @dialog_page.sim_click
end

Quando("excluído uma transferência do agendamento") do
  @confirmar_aprovar_page.remove_transferencia_por_texto("JEFERSON DUARTE SOUZA MOREIRA")
  @dialog_page.sim_click
  sleep 0.5
end

Então("a transferência deve apresentar o status {string}") do |status|
  @confirmar_aprovar_page.get_registro_table_por_texto("JEFERSON DUARTE SOUZA MOREIRA", "5")
end

Então("o valor da transferência não deve ser somado ao valor total do lote") do
  expect(@confirmar_aprovar_page.get_valor_total_do_lote).to eql "R$ 0,11"
end

Dado("que foi confirmado o agendamento de uma transferência") do
  steps %(
    Dado que selecione a opção de transferência "TED"
    E informe os dados do favorecido
    E continue a transferência
    Quando agendado o pagamento para a data "data atual"
    Quando confirmado do agendamento
    E informado o token de autenticação
	  Então deve apresentar aviso de transferência agendada
  )
end

Dado("que o usuário esta na tela de Aprovar agendamento") do
  @historico_page.get_registro_table("1", "4").click
  expect(page).to have_css("span", :text => "APROVAR AGENDAMENTO")
  expect(page).to have_button("Aprovar Agendamento")
end

Quando("aprovado o agendamento") do
  @confirmar_aprovar_page.confirmar_aprovar_click
end

Então("deve apresentar aviso de agendamento aprovado") do
  expect(@dialog_page.get_titulo_mensagem).to eql "TRANSFERÊNCIA APROVADA"
  expect(@dialog_page.get_texto_mensagem).to eql "TRANSFERÊNCIA SERÁ REALIZADA NA DATA DO AGENDAMENTO"
  @dialog_page.ok_click
end

Dado("que foi confirmado o agendamento de transferência em lote") do
  steps %(
    Dado que selecione a opção de transferência "TED"
    E informe os dados do favorecido
    E continue a transferência
    E adicione uma nova transferência
    Quando agendado o pagamento para a data "data atual"
    Quando confirmado do agendamento
    E informado o token de autenticação
    Então deve apresentar aviso de transferência agendada
  )
end

Quando("reprovado do agendamento") do
  @confirmar_aprovar_page.cancelar_reprovar_click
end

Quando("confirmado a reprovação do agendamento") do
  expect(@dialog_page.get_titulo_mensagem).to eql "REPROVAR AGENDAMENTO"
  expect(@dialog_page.get_texto_mensagem).to eql "O LOTE DE TRANSFERÊNCIA SERÁ CANCELADO.\nTEM CERTEZA QUE VOCÊ QUER PROSSEGUIR?"
  @dialog_page.sim_click
end

Então("deve apresentar aviso de agendamento reprovado") do
  expect(@dialog_page.aviso_toast).to eql "LOTE CANCELADO."
end

Então("deve apresentar aviso de transferência removida com sucesso") do
  expect(@dialog_page.aviso_toast).to eql "TRANSFERÊNCIA REMOVIDA."
end
