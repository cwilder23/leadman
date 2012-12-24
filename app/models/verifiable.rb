#
# Any object that can and should be verified should inherit these attributes. This will   
# be used to vet leads.
#
class Verifiable
  include Mongoid::Document
  include Mongoid::Timestamps #for created_at and updated_at 
  include Mongoid::Paranoia #for deleted
  
  field :verified, type: Boolean
  field :updated, type: Time, default: ->{ Verifiable.changed? ? Time.now }
  field :created, type: Time, default: ->{ new_record? ? Time.now }
  
end