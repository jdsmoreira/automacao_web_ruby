Dado("que foi cancelado o agendamento de transferências em lote") do
  steps %(
    Dado que foi realizado o agendamento de transferências em lote
    Quando cancelado do agendamento
    E confirmado o cancelamento do agendamento
    E informado o token de autenticação
  )
end

Quando("acessado a tela de comprovante") do
  @historico_page.get_registro_table("1", "4").click
end

Então("deve apresentar as transferências com satus {string}") do |status|
  #   if (@comprovante_page.get_registro_table("1", "5")) == "PENDENTE"
  expect(@comprovante_page.get_registro_table("1", "5")).to eql status
  expect(@comprovante_page.get_registro_table("2", "5")).to eql status
  #   else
  #     expect(@comprovante_page.get_registro_table("1", "5")).to eql "EXECUTADA"
  #     expect(@comprovante_page.get_registro_table("2", "5")).to eql "EXECUTADA"
  #   end
end

Então("deve apresentar o valor {string} no valor total do lote") do |valor|
  expect(@comprovante_page.get_valor_total_do_lote).to eql "R$ " + valor
end

Então("deve apresentar o valor {string} no valor total transferido") do |valor|
  expect(@comprovante_page.get_valor_total_transferido).to eql "R$ " + valor
end

Dado("que foi reprovado o agendamento de transferências em lote") do
  steps %(
    Dado que foi confirmado o agendamento de transferência em lote
    E que o usuário esta na tela de Aprovar agendamento
    Quando reprovado do agendamento
    E confirmado a reprovação do agendamento
    E informado o token de autenticação        
    )
end

Dado("que foi aprovado o agendamento de transferências em lote") do
  steps %(
	Dado que foi confirmado o agendamento de transferência em lote
    E que o usuário esta na tela de Aprovar agendamento
    Quando aprovado o agendamento
    E informado o token de autenticação
    Então deve apresentar aviso de agendamento aprovado         
    )
end
