class ComprovantePage
  include Capybara::DSL

  def get_registro_table(linha, coluna)
    find(:xpath, "//div[@class='content table-transfers-content']/div[#{linha}]/div[#{coluna}]").text
  end

  def get_valor_total_do_lote
    find(:xpath, "//div[@class='summary row ']/div[3]/div[2]/span").text
  end

  def get_valor_total_transferido
    find(:xpath, "//div[@class='summary row ']/div[3]/div[3]/span").text
  end
end
