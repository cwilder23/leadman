#
# => Add comments
#
class PhoneNumber < Verifiable
  field :phone_number, type: String, required: true
  field :type, type: String, default: 'Home'   #todo: Add a master type lookup
  
  #One-to-one or One-to-many relationships
  #Allows several objects to have phone numbers
  embedded_in :dialable, polymorphic: true    #todo: does this need to be polymorphic and why?
end
