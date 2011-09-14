# encoding: UTF-8
# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    vzs_id '080'
    name 'Vojtěch'
    surname 'Šalbaba'
    auth_level '1'
  end
end
