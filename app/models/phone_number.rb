=begin
  
  Object representation phone number information.  
  
  This object is intended to embedded in other documents.
  See:
    Person
    Company
  
  @author cwilder
    
=end
class PhoneNumber < Verifiable
  field :phone_number, type: String   
    validates_presence_of :phone_number   #required
  field :type, type: String, default: 'home'   #todo: Add a master type lookup
  
  #One-to-one or One-to-many relationships
  #Allows several objects to have phone numbers
  embedded_in :dialable, polymorphic: true    #todo: does this need to be polymorphic and why?
end
