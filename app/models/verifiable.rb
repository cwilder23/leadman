=begin
  
  Any object that can and should be verified should inherit these attributes. This will be used to vet leads.
  See:
    Address
    Email
    PhoneNumber
  
  @author cwilder
    
=end
class Verifiable
  include Mongoid::Document
  include Mongoid::Timestamps #for created_at and updated_at 
  include Mongoid::Paranoia #for deleted
  
  field :verified, type: Boolean, default: false
  
end
