class GoogleAuthenticatorPage
  include Capybara::DSL
  include Helpers

  def set_token_login(token)
    find(:xpath, "//form//div//input[1]").send_keys token
  end

  def set_token(token)
    find("#pinFirst").send_keys token
  end

  def continuar_click
    find(:xpath, "//button[@type='submit']").click
  end

  def alert
    find(:xpath, "//span[@class='msg-codigo-incorreto']").text
  end
end
