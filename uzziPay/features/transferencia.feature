#language: pt

Funcionalidade: Transferencia
	Como usuário do UzzyPay
	Quero poder realizar transferências para contas do UzzyPay e de outros bancos
	como também o agendamento destas transferências

	Contexto:
		Dado que o usuário tenha acessado o menu Transferências > Realizar

	@transferencia @agendamento_de_transferencia @transferencia_para_outros_bancos
	Cenário: Verificar agendamento de transferência para outros bancos
		Dado que selecione a opção de transferência "TED"
			E informe os dados do favorecido
			E continue a transferência
		Quando agendado o pagamento para a data "data atual"
		Então deve ser direcionado para tela de Confirmar agendamento
			E deve listar a transferência

	@transferencia @agendamento_de_transferencia @transferencia_para_contas_uzzypay
	Cenário: Verificar agendamento de transferência para contas UzzyPay
		Dado que selecione a opção de transferência "contas uzzypay"
			E informe os dados da conta UzzyPay
			E continue a transferência
		Quando agendado o pagamento para a data "data atual"
		Então deve ser direcionado para tela de Confirmar agendamento
			E deve listar a transferência para conta UzzyPay

	@transferencia @agendamento_de_transferencia @transferencia_para_outros_bancos_conta_poupanca
	Cenário: Verificar agendamento de transferência para outros bancos e conta poupanca
		Dado que selecione a opção de transferência "TED"
			E informe os dados do favorecido
			E informe o tipo de conta "CONTA POUPANÇA"
			E continue a transferência
		Quando agendado o pagamento para a data "data atual"
		Então deve ser direcionado para tela de Confirmar agendamento
			E deve listar a transferência

	@transferencia @agendamento_de_transferencia @transferencia_para_outros_bancos_conta_poupanca_nao_permitido
	Cenário: Verificar agendamento de transferência para outros bancos com conta poupanca não permitido
		Dado que selecione a opção de transferência "TED"
			E informe os dados do favorecido
		Quando informado o banco "Banco do Brasil S.A."
		Então deve aviso de transferência para conta do tipo poupança não permitido para o banco "BANCO DO BRASIL S.A."
			E apresentar desabilitada a opção "CONTA POUPANÇA - INDISPONÍVEL" no campo tipo

	@transferencia @agendamento_de_tranferencia @transferencia_em_lote
	Cenário: Verificar agendamento em lote de transferências para contas UzzyPay
		Dado que selecione a opção de transferência "contas uzzypay"
			E informe os dados da conta UzzyPay
			E continue a transferência
			E adicione uma nova transferência
		Quando agendado o pagamento para a data "data atual"
		Então deve ser direcionado para tela de Confirmar agendamento
			E deve listar as transferências em lote

	@transferencia @agendamento_de_tranferencia @transferencia_em_lote @exclusao_de_transferência_do_lote
	Cenário: Verificar exclusão de transferência no agendamento em lote de transferências para contas UzzyPay
		Dado que selecione a opção de transferência "contas uzzypay"
			E informe os dados da conta UzzyPay
			E continue a transferência
			E adicione uma nova transferência
		Quando excluir primeira transferência
			E confirmar a exclusão da transferência
		Então deve listar apenas a segunda tranfêrencia

	@transferencia @confirmar_agendamento_de_transferencia
	Cenário: Verificar confirmação do agendamento de transferência
		Dado que foi realizado o agendamento de uma transferência
			E que o usuário esta na tela de Confirmar agendamento
		Quando confirmado do agendamento
			E informado o token de autenticação
		Então deve apresentar aviso de transferência agendada
			E deve apresentar a tela de histórico
			E deve apresentar o agendamento com status "AGENDADA"

	@transferencia @confirmar_agendamento_de_transferencia_em_lote
	Cenário: Verificar confirmação do agendamento de transferência em lote
		Dado que foi realizado o agendamento de transferências em lote
			E que o usuário esta na tela de Confirmar agendamento
		Quando confirmado do agendamento
			E informado o token de autenticação
		Então deve apresentar aviso de transferência agendada
			E deve apresentar a tela de histórico
			E deve apresentar o agendamento com status "AGENDADA"

	@transferencia @cancelamento_de_agendamento_de_transferencia
	Cenário: Verificar cancelamento do agendamento de transferência
		Dado que foi realizado o agendamento de uma transferência
			E que o usuário esta na tela de Confirmar agendamento
		Quando cancelado do agendamento
			E confirmado o cancelamento do agendamento
			E informado o token de autenticação
		Então deve apresentar a tela de histórico
			E deve apresentar o agendamento com status "CANCELADA"

	@transferencia @cancelamento_de_agendamento_de_transferencia_em_lote
	Cenário: Verificar cancelamento do agendamento de transferência em lote
		Dado que foi realizado o agendamento de transferências em lote
			E que o usuário esta na tela de Confirmar agendamento
		Quando cancelado do agendamento
			E confirmado o cancelamento do agendamento
			E informado o token de autenticação
		Então deve apresentar a tela de histórico
			E deve apresentar o agendamento com status "CANCELADA"

	@transferencia @exclusao_de_transferência_do_lote_na_confirmacao_de_agendamento
	Cenário: Verificar exclusão de transferência na confirmação do agendamento de transferência em lote
		Dado que foi realizado o agendamento de transferências em lote
			E que o usuário esta na tela de Confirmar agendamento
		Quando excluído uma transferência do agendamento
		Então a transferência deve apresentar o status "REMOVIDO"
			E o valor da transferência não deve ser somado ao valor total do lote

	@transferencia @aprovar_agendamento_de_transferencia
	Cenário: Verificar aprovação do agendamento de transferência
		Dado que foi confirmado o agendamento de uma transferência
			E que o usuário esta na tela de Aprovar agendamento
		Quando aprovado o agendamento
			E informado o token de autenticação
		Então deve apresentar aviso de agendamento aprovado
			E deve apresentar o agendamento com status "APROVADA"

	@transferencia @aprovar_agendamento_de_transferencia_em_lote
	Cenário: Verificar aprovação do agendamento de transferência em lote
		Dado que foi confirmado o agendamento de transferência em lote
			E que o usuário esta na tela de Aprovar agendamento
		Quando aprovado o agendamento
			E informado o token de autenticação
		Então deve apresentar aviso de agendamento aprovado
			E deve apresentar o agendamento com status "APROVADA"

	@transferencia @reprovar_agendamento_de_transferencia
	Cenário: Verificar reprovação do agendamento de transferência
		Dado que foi confirmado o agendamento de uma transferência
			E que o usuário esta na tela de Aprovar agendamento
		Quando reprovado do agendamento
			E confirmado a reprovação do agendamento
			E informado o token de autenticação
		Então deve apresentar aviso de agendamento reprovado
			E deve apresentar o agendamento com status "REPROVADA"

@transferencia @reprovar_agendamento_de_transferencia_em_lote
Cenário: Verificar reprovação do agendamento de transferência em lote
	Dado que foi confirmado o agendamento de transferência em lote
	E que o usuário esta na tela de Aprovar agendamento
	Quando reprovado do agendamento
	E confirmado a reprovação do agendamento
	E informado o token de autenticação
	Então deve apresentar aviso de agendamento reprovado
	E deve apresentar o agendamento com status "REPROVADA"	

@transferencia @exclusao_de_transferência_do_lote_na_aprovacao_de_agendamento
Cenário: Verificar exclusão de transferência do agendamento na aprovação do agendamento em lote
	Dado que foi confirmado o agendamento de transferência em lote
	E que o usuário esta na tela de Aprovar agendamento
	Quando excluído uma transferência do agendamento
	Então deve apresentar aviso de transferência removida com sucesso
	E a transferência deve apresentar o status "REMOVIDO"
	E o valor da transferência não deve ser somado ao valor total do lote			

@transferencia @cancelamento_de_agendamento_de_transferencia @comprovante_historico_agendamento_cancelado
Cenário: Verificar comprovante de transferência após cancelamento do agendamento
	Dado que foi cancelado o agendamento de transferências em lote
	Quando acessado a tela de comprovante
	Então deve apresentar as transferências com satus "REPROVADA"
	E deve apresentar o valor "0,00" no valor total do lote
	E deve apresentar o valor "0,00" no valor total transferido	

@transferencia @reprovar_agendamento_de_transferencia_em_lote @comprovante_historico_agendamento_reprovado
Cenário: Verificar comprovante de transferência após reprovar agendamento
	Dado que foi reprovado o agendamento de transferências em lote
	Quando acessado a tela de comprovante
	Então deve apresentar as transferências com satus "REPROVADA"
	E deve apresentar o valor "0,00" no valor total do lote
	E deve apresentar o valor "0,00" no valor total transferido	

@transferencia @aprovar_agendamento_de_transferencia_em_lote @comprovante_historico_agendamento_aprovado
Cenário: Verificar comprovante de transferência após aprovar do agendamento
	Dado que foi aprovado o agendamento de transferências em lote
	Quando acessado a tela de comprovante
	Então deve apresentar as transferências com satus "PENDENTE"
	E deve apresentar o valor "3,04" no valor total do lote
	E deve apresentar o valor "0,20" no valor total transferido	