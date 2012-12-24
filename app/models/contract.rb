class Contract
  include Mongoid::Document
  field :start_time, type: Time
  field :end_time, type: Time
  field :cost_per_lead, type: Float
  field :loan_payout_percentage, type: Float
end
