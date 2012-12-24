# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :person do |p|
    p.first "John"
    p.middle "Munky"
    p.last "Doe"
    p.active true
  end
end
