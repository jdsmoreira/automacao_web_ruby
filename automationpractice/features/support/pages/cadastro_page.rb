class CadastroPage
  include Capybara::DSL

  def personal_information(*args)
    choose(args[0])
    find("input[name='customer_firstname']").set (args[1])
    find("input[name='customer_lastname']").set (args[2])
    find(:id, "passwd").set(args[3])

    find("#days", visible: false).first(:option, text: args[4]).select_option
    find("#months", visible: false).find(:option, text: args[5]).select_option
    find("#years", visible: false).find(:option, text: args[6]).select_option

    #Quando checkbox não é visivel usar  este parâmetro
    check ("newsletter"), allow_label_click: true
    check ("optin"), allow_label_click: true
  end

  def address_information(*args)
    find("#firstname").set(args[0])
    find("#lastname").set(args[1])
    find("#company").set(args[2])
    find("#address1").set(args[3])
    find("#address2", visible: false).set(args[4])
    find("#city").set(args[5])
    find("#id_state", visible: false).find(:option, text: args[6]).select_option
    find("#postcode").set(args[7])
    find("#id_country", visible: false).find(:option, text: args[8]).select_option

    find("#other").set(args[9])
    find("#phone").set(args[10])
    find("#phone_mobile").set(args[11])
    find("#alias").set(args[12])
  end

  def register
    click_button "Register"
  end
end
