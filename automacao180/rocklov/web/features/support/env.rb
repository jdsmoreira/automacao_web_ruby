require "allure-cucumber"
require "capybara"
require "capybara/cucumber"
require "faker"

#Constante que carrega o arquivo de configurações cucumber.yml
CONFIG = YAML.load_file(File.join(Dir.pwd, "features/support/config/#{ENV["CONFIG"]}"))

case ENV["BROWSER"]
when "firefox"
  @driver = :selenium
when "chrome"
  @driver = :selenium_chrome
when "fire_headless"
  @driver = :selenium_headless
when "chrome_headless"
  Capybara.register_driver :selenium_chrome_headless do |app|
    Capybara::Selenium::Driver.load_selenium
    browser_options = ::Selenium::WebDriver::Chrome::Options.new.tap do |opts|
      opts.add_argument("--headless")
      opts.add_argument("--disable-gpu")
      opts.add_argument("--disable-site-isolation-trials")
      opts.add_argument("--no-sandbox")
      opts.add_argument("--disable-dev-shm-usage")
    end
    Capybara::Selenium::Driver.new(app, browser: :chrome, options: browser_options)
  end

  @driver = :selenium_chrome_headless
else
  raise "Navegador incorreto, variável @driver está vazia :("
end

#remover warnings do chrome no console
# Capybara.register_driver :chrome_custom do |app|
#   caps = Selenium::WebDriver::Remote::Capabilities.chrome(
#     "chromeOptions" => {
#       "args" => ["--headless", "--disable-site-isolation-trials", "--disable-gpu"],
#       "excludeSwitches" => ["enable-logging"],
#     },
#   )
#   Capybara::Selenium::Driver.new(app, :browser => :chrome, :desired_capabilities => caps)
# end

Capybara.configure do |config|
  config.default_driver = @driver
  #config.default_driver = :chrome_custom
  config.app_host = CONFIG["url"]
  config.default_max_wait_time = 10
end

AllureCucumber.configure do |config|
  config.results_directory = "/logs"
  config.clean_results_directory = true
end
