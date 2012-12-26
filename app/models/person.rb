=begin
  
  Object representation of a person. It is intended to be general type.  
  
  See:
    User
    Lead
  
  
  This object contains embedded documents.
  
  @author cwilder
    
=end
class Person
  include Mongoid::Document
  include Mongoid::Timestamps #for created_at and updated_at 
  include Mongoid::Paranoia #for deleted
  
  field :first, type: String   
    validates_presence_of :first    #required
  field :middle, type: String  
  field :last, type: String   
    validates_presence_of :last     #required
  field :active, type: Boolean, default: true
    validates_presence_of :active   #required
  
  
  #One-to-one or One-to-many relationships
  #
  #One-to-many relationships
  # Setting cascade callbacks so that callbacks on embedded documents are fired-off when the parent document is saved.
  # Setting destroy method for the dependent so that the dependant object are delete when the parent is removed and it will fire all callbacks (not true with the delete option)
  # Setting validate to false b/c we want to flexible in storing person records. Use the View/Controller to enforce an or condition on contact information.
  embeds_many :addresses, as: :addressable, cascade_callbacks: true, validate: false
  embeds_many :email_addresses, class_name: "Email", as: :emailable, cascade_callbacks: true, validate: false
  embeds_many :phone_numbers, as: :dialable, cascade_callbacks: true, validate: false
  

end
