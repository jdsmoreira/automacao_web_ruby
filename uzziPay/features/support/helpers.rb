require "totp"
require "rotp"

module Helpers
  def get_token
    token = TOTP.passwords("LQTWORL4MBM372UO")
    token[0]
  end

  def get_data_atual
    Date.today.strftime("%d/%m/%Y")
  end
end
