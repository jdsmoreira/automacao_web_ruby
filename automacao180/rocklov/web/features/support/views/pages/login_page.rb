class LoginPage
  include Capybara::DSL

  def open
    visit "/"
  end

  def wtih(email, password)
    find("input[placeholder='Seu email']").set email
    find("input[type=password]").set password
    click_button "Entrar"
  end
end
