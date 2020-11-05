#language: pt

Funcionalidade: Cadastro de Usuários
    Sendo um visitante do site de Orders - My Store
    Quero fazer o meu Cadastro
    Para que eu possa realizar minhas compras

    @happy
    Cenário: Cadastro email válido
        Dado que acesso a página de login
        Quando informo o email "jdwather@gmail.com" para criar uma conta
        Então devo ser redirecionado para o formulário de cadastro

    @tentativa
    Esquema do Cenário: Cadastro email inválido
        Dado que acesso a página de login
        Quando informo o email "<email>" para criar uma conta
        Então devo ver a mensagem "Invalid email address."

        Exemplos:
            | email           |
            | jeferson        |
            | jeferson@123    |
            | jeferson@gmail. |

