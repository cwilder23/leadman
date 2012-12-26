=begin
  
  Object representation email information.  
  
  This object is intended to embedded in other documents.
  See:
    Person
    Company
  
  @author cwilder
    
=end
class Email < Verifiable
  field :email, type: String
    validates_presence_of :email   #required
  field :type, type: String, default: 'personal'   #todo: Add a master type lookup
  
  #One-to-one or One-to-many relationships
  #Allows several object to have addresses
  embedded_in  :emailable, polymorphic: true
  
  #NOTE: THE FOLLOWING SECTION CAME FROM THE OLDLEADMAN, WHICH USED MONGO_MAPPER. SO IT MAY CAUSE ISSUES.
  #Regex for email validation
  RegEmailName = '[\w\.%\+\-]+'
  RegDomainHead = '(?:[A-Z0-9\-]+\.)+'
  RegDomainTLD = '(?:[A-Z]{2}|com|org|net|gov|mil|biz|info|mobi|name|aero|jobs|museum)'
  RegEmailOk = /\A#{RegEmailName}@#{RegDomainHead}#{RegDomainTLD}\z/i
  
  #Validate email addresses
  validates_length_of :email,    :within => 6..100, :allow_blank => true
  validates_format_of :email,    :with => RegEmailOk, :allow_blank => true
end
