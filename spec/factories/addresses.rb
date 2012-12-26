# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :home_address, class: Address do |a|
    a.address1 "123 Fun circle"
    a.address2 ""
    a.city "Nomans"
    a.state "ME"
    a.zip 12345
  end
  
  factory :work_address, class: Address do |a|
    a.address1 "456 Busy street"
    a.address2 "Suite 666"
    a.city "Nomans"
    a.state "ME"
    a.zip 12345
    a.type "work"
  end
end
