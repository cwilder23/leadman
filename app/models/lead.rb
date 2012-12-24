class Lead
  include Mongoid::Document
  field :loan_amount, type: Float
  field :loan_type, type: String
  field :status, type: String
  field :credit_score, type: Integer
end
