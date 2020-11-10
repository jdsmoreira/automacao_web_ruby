class ProductPage
  include Capybara::DSL

  def add_dress_cart
    find("#color_16").click
    find("#group_1", visible: false).find(:option, text: "L").select_option
    find("#add_to_cart").click
  end
end
