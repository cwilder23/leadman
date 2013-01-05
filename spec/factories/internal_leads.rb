# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :internal_lead do
    loan_amount 1.5
    loan_type "MyString"
    status "MyString"
    credit_score 1
  end
end
