#
# => Add comments
#
class Address < Verifiable
  field :address1, type: String, required: true
  field :address2, type: String
  field :city, type: String, required: true
  field :state, type: String, required: true
  field :zip, type: Integer, required: true
  field :zip2, type: Integer
  field :type, type: String, default: 'HOME' #todo: Add a master type lookup
  
  #One-to-one or One-to-many relationships
  #Allows several object to have addresses
  embedded_in  :addressable, polymorphic: true
end
