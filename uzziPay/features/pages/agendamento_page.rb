class AgendamentoPage
  include Capybara::DSL
  include Helpers

  def set_data(data)
    if data = "data atual"
      find("#input-date").set get_data_atual
    else
      find("#input-date").set data
    end
  end
end
