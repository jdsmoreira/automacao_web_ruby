class MenuPage
  include Capybara::DSL

  def home_click
    find(:xpath, "//app-menu").hover
    find(:xpath, "//app-menu//*[@class='menu-item' and .='Home']").click
  end

  def minha_conta_click
    find(:xpath, "//app-menu").hover
    find(:xpath, "//app-menu//*[@class='menu-item' and .='Minha Conta']").click
  end

  def informacoes_click
    minha_conta_click
    find(:xpath, "a[@class='menu-item']|//*[@class='text' and .='Informações']").click
  end

  def extrato_click
    minha_conta_click
    find(:xpath, "a[@class='menu-item']|//*[@class='text' and .='Extrato']").click
  end

  def deposito_click
    minha_conta_click
    find(:xpath, "a[@class='menu-item']|//*[@class='text' and .='Depósito']").click
  end

  def transferencia_click
    find(:xpath, "//app-menu").hover
    find(:xpath, "//app-menu//*[@class='menu-item' and .='Transferência']").click
  end

  def historico_transferencia_click
    transferencia_click
    find(:xpath, "a[@class='menu-item']|//*[@class='text' and .='Histórico']").click
  end

  def efetuadas_transferencia_click
    transferencia_click
    find(:xpath, "a[@class='menu-item']|//*[@class='text' and .='Efetuadas']").click
  end

  def realizar_transferencia_click
    transferencia_click
    find(:xpath, "a[@class='menu-item']|//*[@class='text' and .='Realizar']").click
  end
end
