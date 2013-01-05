=begin
  
  Object representation for an internal lead.  
  
  THIS OBJECT SHOULD BE MERGED WITH THE LEAD OBJECT WHEN READY.
  I RENAMED IT TO INTERNAL_LEAD B/C I WANT TO USE THE BOOTSTRAP GENERATOR 
  TO CREATE A LEAD FORM.
  
  @author cwilder
    
=end
class InternalLead
  include Mongoid::Document
  field :loan_amount, type: Float
  field :loan_type, type: String
  field :status, type: String
  field :credit_score, type: Integer
end
