#language: pt
Funcionalidade: Login
			Eu como administrador da conta PJ
	Quero poder realizar login
	Para gerenciar minha conta

	@login @sucesso
	Cenário: Login com sucesso
		Dado que estou na página de login da Uzzipay
			E submeto minhas credenciais com: "851.964.465-16" e "rovema2020"
			E informo o token de acesso
		Quando confirmo o token
		Então deve apresentar a tela inicial

	@login @tentativa
	Esquema do Cenário: Tentativa de login
		Dado que estou na página de login da Uzzipay
		Quando submeto minhas credenciais com: "<usuario>" e "<senha>"
		Então deve apresentar o alerta "OOPS!"
			E a mensagem de erro "USUÁRIO E/OU SENHA INCORRETOS"
		Exemplos:
			| usuario        | senha    |
			| 00607819000112 | tiale5   |
			| 03211498150    | teste123 |

	@login @token_invalido
	Cenário: Tentativa de login com token inválido
		Dado que estou na página de login da Uzzipay
			E submeto minhas credenciais com: "usuário padrão" e "senha padrão"
			E informo o token de inválido
		Quando confirmo o token
		Então deve apresentar o alerta de token inválido "CÓDIGO INVÁLIDO"
			E deve permanecer na página de token