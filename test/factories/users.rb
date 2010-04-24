Factory.define :user do |f|
  f.sequence(:vzs_id) { |n| "0#{n}" }
  f.name 'vojta'
  f.surname 'dvojta'
  f.auth_level '1'
end

