class DashPage
  include Capybara::DSL

  # Quando adicionado "?" no nome do metodo, eleretorna true ou false,
  def on_dash?
    page.has_css?(".dashboard")
  end

  def goto_equipo_form
    click_button "Criar anúncio"
  end

  def equipo_list
    find(".equipo-list")
  end

  def has_no_equipo?(name)
    page.has_no_css?(".equipo-list li", text: name)
  end

  def request_removal(name)
    equipo = find(".equipo-list li", text: name)
    equipo.find(".delete-icon").click
  end

  def confirm_removal
    click_on "Sim"
  end

  def cancel_removal
    click_on "Não"
  end

  def order
    find(".notifications p")
  end

  def order_actions(name)
    page.has_css?(".notifications button", text: name)
  end
end
