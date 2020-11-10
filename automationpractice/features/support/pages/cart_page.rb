class CartPage
  include Capybara::DSL

  def item_tr(desc)
    find("table tbody tr", text: desc)
  end

  def tfoot_tr(desc)
    find("table tbody tfoot tr", text: desc)
  end

  def total_prod
    find("#total_product").text
  end

  def total_ship
    find("#total_shipping").text
  end

  def total_whihout_tax
    find("#total_price_without_tax").text
  end

  def total_tax
    find("#total_tax").text
  end

  def total
    find("#total_price_container").text
  end
end
