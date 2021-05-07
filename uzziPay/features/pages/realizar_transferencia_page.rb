class RealizarTransferenciaPage
  include Capybara::DSL

  def transferencia_para(opcao)
    case opcao
    when "TED"
      find(:xpath, "//nb-radio[@name='transferBankOption']").click
    when "contas uzzypay"
      find(:xpath, "//nb-radio[@name='transferInternalOption']").click
    when "PIX"
      find(:xpath, "//nb-radio[@name='transferPixOption']").click
    else
      "Opção #{opcao} não encontrada"
    end
  end

  def banco
    find(:xpath, "//div/input[@type='text']")
  end

  def seleciona_banco(banco)
    find(:xpath, "//div/input[@type='text']").click
    find(:xpath, "//a[@class='item-suggested']/span[contains(text(), '#{banco}')]").click
  end

  def agencia
    find("#input-destinationAccountBranch")
  end

  def conta
    find("#input-destinationAccountNumberDv")
  end

  def cpf_cnpj
    find("#input-personalDocument")
  end

  def tipo_conta()
    find(:xpath, "//button[@type='button' and contains(@class, 'select-button')]")
  end

  def seleciona_tipo_conta(tipo)
    tipo_conta.click
    find(:xpath, "//nb-option[.='#{tipo}']")
  end

  def nome_favorecido
    find("#input-destinationName")
  end

  def valor_da_transferencia
    find("#input-totalAmount")
  end

  def valor_da_transferencia_entre_contas_uzzipay
    find("#input-amount")
  end

  def identificacao_da_transferencia
    find("#input-transferIdentification")
  end

  def identificacao_da_transferencia_entre_contas_uzzipay
    find("#input-description")
  end

  def continuar_click
    #find(:xpath, "//button[normalize-space()='Continuar']").click
    click_button "Continuar"
  end

  def cancelar_click
    #find(:name, "//button[normalize-space()='Continuar']").click
    click_button "Cancelar"
  end

  def message
    find(:xpath, "//div[@class='message']").text
  end

  def nova_transferencia_click
    click_button "Nova Transferência"
  end

  def remove_transferencia_por_texto(texto)
    find(:xpath, "//div[@class='transfer-box']//dd[contains(text(), '#{texto}')]/../../../button[@class='transfer-remove']").click
  end
end
