class AddressPage
  include Capybara::DSL

  def get_text_adress_delivery
    find("#address_delivery").text.split(" ")
  end
end
