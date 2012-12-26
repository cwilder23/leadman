require 'spec_helper'


describe Person do

  before(:each) do
    @person = FactoryGirl.build(:person)
    @person.addresses = [FactoryGirl.build(:home_address), FactoryGirl.build(:work_address)]
    @person.email_addresses = [FactoryGirl.build(:personal_email),FactoryGirl.build(:work_email)]
    @person.phone_numbers = [FactoryGirl.build(:home_phone),FactoryGirl.build(:work_phone)]
  end
  
  #Current #{__FILE__}"
  it "should create a new person without an address, or, and phone numbers" do
    FactoryGirl.create(:person)
  end
  
  it "should create a new person with address, email, and phone numbers" do
    @person.save!
  end
  
  it "should be able to be queried" do
    @person.save
    records = Person.where(first: "John", last: "Doe")
    records.should_not be_nil
    records.count.should === 1
    person = records.first
    
    #Validate the person
    person.first.should === "John"
    person.middle.should === "Munky"
    person.last.should === "Doe"
    person.active.should be_true
    
    #Validate the addresses
    addrs = person.addresses
    addrs.length.should === 2
    
    addr1 = addrs[0]
    addr1.address1.should === "123 Fun circle"
    addr1.address2.should === ""
    addr1.city.should === "Nomans"
    addr1.state.should === "ME"
    addr1.zip.should === 12345
    addr1.created_at.should_not be_nil
    addr1.updated_at.should_not be_nil
    addr1.verified.should be_false
    
    addr2 = addrs[1]
    addr2.address1.should === "456 Busy street"
    addr2.address2.should === "Suite 666"
    addr2.city.should === "Nomans"
    addr2.state.should === "ME"
    addr2.zip.should === 12345
    addr2.type.should === "work"
    addr2.created_at.should_not be_nil
    addr2.updated_at.should_not be_nil
    addr2.verified.should be_false
    
    #Validate the phone numbers
    phone_numbers = person.phone_numbers
    phone_numbers.length.should === 2
    
    phone1 = phone_numbers[0]
    phone1.phone_number.should === "555-123-4567"
    phone1.type.should === "home"
    phone1.created_at.should_not be_nil
    phone1.updated_at.should_not be_nil
    phone1.verified.should be_false
    
    phone2 = phone_numbers[1]
    phone2.phone_number.should === "666-987-6543"
    phone2.type.should === "work"
    phone2.created_at.should_not be_nil
    phone2.updated_at.should_not be_nil
    phone2.verified.should be_false
    
    
    #Validate the email address
    emails = person.email_addresses
    emails.length.should === 2
    
    email1 = emails[0]
    email1.email.should === "john.doe@home.com"
    email1.type.should === "personal"
    email1.created_at.should_not be_nil
    email1.updated_at.should_not be_nil
    email1.verified.should be_false
    
    email2 = emails[1]
    email2.email.should === "john.doe@work.com"
    email2.type.should === "work"
    email2.created_at.should_not be_nil
    email2.updated_at.should_not be_nil
    email2.verified.should be_false
    
    #person..should === ""
    #person..should === ""
    #person..should === ""
    #person..should === ""
    
  end
  
  it "should be able to change address" do
    #@todo: implement
  end
  
  it "should be able to change phone numbers" do 
    #@todo: implement
  end
  
  #Test delete/paranoid
  it "should not ever be completely deleted" do
    #@todo: implement
  end
  
  it "should be able to add a new phone number" do
    #@todo: implement
  end
  
end
