require 'faker'

FactoryGirl.define do
  factory :player do |p|
    p.player_code 'aaaaaaa01'
    p.birth_year '1950'
    p.first_name { Faker::Name.first_name }
    p.last_name { Faker::Name.last_name }
  end
end