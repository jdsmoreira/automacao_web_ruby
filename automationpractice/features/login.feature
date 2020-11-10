#language: pt

Funcionalidade: Login
    Sendo um visitante do site de Orders - My Store
    Quero fazer o Login
    Para que eu possa realizar minhas compras

    @login
    Cenário: Login
        Dado que acesso a página de login
        Quando submeto minhas credenciais com: "jdwather@gmail.com" e "pwd123"
        Então devo ser redirecionado para areá da minha conta