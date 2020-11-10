#language: pt

Funcionalidade: Cadastro de Usuários
    Sendo um visitante do site de Orders - My Store
    Quero fazer o meu Cadastro
    Para que eu possa realizar minhas compras


    Cenário: Cadastro email válido
        Dado que acesso a página de login
        Quando informo o email "jdwather132@gmail.com" para criar uma conta
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

    @happy
    Cenário: Cadastro com sucesso
        Dado que acesso a página de login
        Quando informo o email "jdwather3@gmail.com" para criar uma conta
            E submeto o formulário com os dados:
            | title              | Mr.                |
            | first_name         | Jeferson           |
            | last_name          | Moreira            |
            | email              | jdwather@gmail.com |
            | password           | pwd123             |
            | day_birth          | 2                  |
            | month_birth        | April              |
            | year_birth         | 1993               |
            | sign_up_newslleter | false              |
            | reiceive_offers    | false              |
            | address_first_name | Jeferson           |
            | address_last_name  | Moreira            |
            | company            | CWI                |
            | address            | Rua teste          |
            | address2           | Rua teste2         |
            | city               | Cascavel           |
            | state              | California         |
            | zip                | 30002              |
            | country            | United States      |
            | add_inf            | inf blá blá        |
            | home_phone         | 322721231          |
            | mobile_phone       | 45998001523        |
            | address_reference  | Rua teste          |
        Então devo ser redirecionado para areá da minha conta

