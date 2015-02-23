# -- spec_helper.rb -- #
require 'simplecov'
SimpleCov.start do
  add_filter '/spec/'
end

require 'rspec'
require 'factory_girl'
require 'database_cleaner'

#require_relative '../lib/baseball'
Dir["#{File.expand_path('lib')}/**/*.rb"].each { |file| require file }

# ActiveRecord::Base.logger = Logger.new(STDERR)
Baseball::MemDb.create_data_structure
Baseball::Importer.load_batting_data '../../spec/fixtures/test_statistics.csv'
Baseball::Importer.load_players '../../spec/fixtures/test_players.csv'


RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.mock_with :rspec do |mocks|
  end
  # config.use_transactional_fixtures = false
end
