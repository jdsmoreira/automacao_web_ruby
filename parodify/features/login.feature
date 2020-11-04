#language :pt

Funcionalidade: Login
    Sendo um usuário previamente cadastrado
    Quero acessar o sistema com meu email e senha
    Para que eu possa ter acesso as playlists do Parodify

    @smoke
    Cenário: Login do usuário
        Dado que acesso página login
        Quando submeto minhas credenciais com: "jdwather@gmail.com" e "pwd123"
        Então devo ser redirecionado para a área logada

    Esquema do Cenário: Tentativa de login
        Dado que acesso página login
        Quando submeto minhas credenciais com: "<email>" e "<senha>"
        Então devo ver a mensagem de erro: "Opps! Dados de acesso incorretos!"

        Exemplos:
            | email          | senha  |
            | lokjas2@ee.com | abc123 |
            |                |        |
            |                | abc123 |
            | lokjas2@ee.com |        |
