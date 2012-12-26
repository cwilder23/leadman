# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :home_phone, class: PhoneNumber do |pn|
    pn.phone_number "555-123-4567"
  end
  
  factory :work_phone, class: PhoneNumber do |pn|
    pn.phone_number "666-987-6543"
    pn.type "work"
  end

end
