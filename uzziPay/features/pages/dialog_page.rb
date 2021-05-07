class DialogPage
  include Capybara::DSL

  def get_texto_mensagem
    find(:xpath, "//p[@class='message']").text
  end

  def sim_click
    click_button("Sim")
  end

  def nao_click
    click_button("Não")
  end

  def get_titulo_mensagem
    find(:xpath, "//div[@class='header']//div").text
  end

  def ok_click
    #find(:xpath, "//app-dialog//div//button[ contains(text(),'OK, entendi.')]").click
    click_button("OK, entendi.")
  end

  def aviso_toast
    find(:xpath, "//nb-toast").text
  end
end
