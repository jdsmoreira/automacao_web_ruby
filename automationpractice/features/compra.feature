#language: pt

Funcionalidade: Comprar
    Sendo um visitante do site de Orders - My Store
    Quero fazer uma compra

    Contexto: Login
        * Login com "jdwather@gmail.com" e "pwd123"

    @compra
    Cenário: Realizar compra com usuário autenticado
        Dado que vou comprar um vestido
            E adiciono um vestido ao carrinho
            E prossigo com o pedido
            E escolho o metodo de entrega
        Quando confirmo este pagamento
        Então vejo que foi realizado o pedido com sucesso

    @cart
    Cenário: Verificar carrinho de compras
        Dado que vou comprar um vestido
            E adiciono um vestido ao carrinho
        Quando adiciono uma blusa
            E vou para a verificação do carrinho
        Então vejo o meu carrinho com o itens adicionados:
            | item                 | qtde | total |
            | Printed Summer Dress | 1    | 28.98 |
            | Blouse               | 1    | 27.00 |
            E com totalizadores:
            | total_prod | total_ship | tax  | total |
            | $55.98      | $2.00       | $0.00 | $57.98 |