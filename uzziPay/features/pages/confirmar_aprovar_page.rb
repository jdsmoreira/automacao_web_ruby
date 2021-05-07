class ConfirmarAprovarPage
  include Capybara::DSL

  def get_registro_table(linha, coluna)
    find(:xpath, "//div[@class='table text-center primary-300']/div[2]/div[#{linha}]/div[#{coluna}]").text
  end

  def get_registro_table_por_texto(texto, coluna)
    find(:xpath, "//div[@class='table text-center primary-300']//div[contains(text(), '#{texto}')]/../div[#{coluna}]").text
  end

  def confirmar_aprovar_click
    find(:xpath, "//button[@name='btnApproval']").click
  end

  def cancelar_reprovar_click
    find(:xpath, "//button[@name='btnReprove']").click
  end

  def remove_transferencia_por_texto(texto)
    find(:xpath, "//div[contains(text(), '#{texto}')]/../div[6]/button[@class='icon remove']").click
  end

  def get_valor_total_do_lote
    find(:xpath, "//div[@class='box summary']/div[1]/div[3]/div[2]/span").text
  end
end
