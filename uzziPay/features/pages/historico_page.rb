class HistoricoPage
  include Capybara::DSL

  def get_registro_table(linha, coluna)
    find(:xpath, "//div[@class='table text-center large-height primary-200 table-historic']/div[2]/div[#{linha}]/div[#{coluna}]")
  end
end
