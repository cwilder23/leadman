=begin
  
  Object representation street addressable information.  
  
  This object is intended to embedded in other documents.
  See:
    Person
    Company
  
  @author cwilder
    
=end
class Address < Verifiable
  field :address1, type: String
    validates_presence_of :address1   #required
  field :address2, type: String
  field :city, type: String
    validates_presence_of :city   #required
  field :state, type: String
    validates_presence_of :state   #required
  field :zip, type: Integer
    validates_presence_of :zip   #required
  field :zip2, type: Integer
  field :type, type: String, default: 'home' #todo: Add a master type lookup
  
  #One-to-one or One-to-many relationships
  #Allows several object to have addresses
  embedded_in  :addressable, polymorphic: true
end
