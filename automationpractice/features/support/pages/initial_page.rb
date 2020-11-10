class InitialPage
  include Capybara::DSL

  def click_dresses_cat
    click_on "Dresses"
  end

  def click_woman_cat
    first(:link, "Women").click
  end

  def select_dresses_yellow
    find(:xpath, "//img[@src='http://automationpractice.com/img/p/1/2/12-home_default.jpg']").hover
    #find(:xpath, "//a[@href='http://automationpractice.com/index.php?controller=cart&add=1&id_product=5&token=fb4da4b0f29f9950b3b94121f97c8307']").click
    find(:id, "color_19").click
  end

  def select_blouse
    find(:xpath, "//img[@src='http://automationpractice.com/img/p/7/7-home_default.jpg']").hover
    find(:xpath, "//a[@href='http://automationpractice.com/index.php?controller=cart&add=1&id_product=2&token=fb4da4b0f29f9950b3b94121f97c8307']").click
  end
end
