#
# => Add comments
#
class Person
  include Mongoid::Document
  include Mongoid::Timestamps #for created_at and updated_at 
  include Mongoid::Paranoia #for deleted
  
  field :first, type: String, required: true
  field :middle, type: String
  field :last, type: String, required: true
  field :active, type: Boolean, required: true, default: true
  #field :updated, type: Time, default: ->{ Person.changed? ? Time.now}
  #field :created, type: Time, default: ->{ new_record? ? Time.now }
  
  #One-to-one or One-to-many relationships
  #Allows several object to have addresses
  #One-to-many relationships
  embeds_many :addresses, as: :addressable
  embeds_many :email_addresses, as: :emailable
  embeds_many :phone_numbers, as: :dialable 
end
