class LoginPage
  include Capybara::DSL

  def go
    visit ""
  end

  def login_with(email, password)
    find("#usernameUserInput").set email
    find("#password").set password
    find(:xpath, "//button[@type='submit']").click
  end

  def alert
    find(:xpath, "//div/label[@class='label3']").text
  end

  def error_message
    find("#error-msg").text
  end
end
