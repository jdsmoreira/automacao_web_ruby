require_relative "routes/signup"
require_relative "routes/sessions"
require_relative "routes/equipos"

require_relative "libs/mongo"
require_relative "helpers"

require "digest/md5"

require "allure-rspec"

def tod_md5(pass)
  return Digest::MD5.hexdigest(pass)
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  # é executado antes de todos os testes
  config.before(:suite) do
    users = [
      { name: "Roberto Silva", email: "betao@hotmail.com", password: tod_md5("pwd123") },
      { name: "Tomate", email: "to@mate.com", password: tod_md5("pwd123") },
      { name: "Penelope", email: "penelope@gmail.com", password: tod_md5("pwd123") },
      { name: "Joe Perry", email: "joe@gmail.com", password: tod_md5("pwd123") },
      { name: "Edward Cullen", email: "ed@gmail.com", password: tod_md5("pwd123") },
    ]

    MongoDB.new.drop_danger
    MongoDB.new.insert_users(users)
  end

  AllureRspec.configure do |config|
    config.results_directory = "/logs"
    config.clean_results_directory = true
    config.logging_level = Logger::INFO
  end
end
