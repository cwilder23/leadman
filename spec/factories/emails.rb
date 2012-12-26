# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :personal_email, class: Email do |e|
    e.email "john.doe@home.com"
  end
  
  factory :work_email, class: Email do |e|
    e.email "john.doe@work.com"
    e.type "work"
  end
end
