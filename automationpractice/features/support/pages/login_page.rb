class LoginPage
  include Capybara::DSL

  def goto_login
    visit "/"
    click_on("Sign in")
  end

  def email_new_account(email)
    find("input[name=email_create]").set email
    click_button "Create an account"
  end

  def alert_new_account
    find(:id, "create_account_error").text
  end

  def login(email, password)
    find("#email").set email
    find("#passwd").set password
    click_button "Sign in"
  end
end
