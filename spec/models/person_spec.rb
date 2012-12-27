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
    records.count.should be == 1
    person = records.first
    
    #Validate the person
    person.first.should be == "John"
    person.middle.should be == "Munky"
    person.last.should be == "Doe"
    person.active.should be_true
    
    #Validate the addresses
    addrs = person.addresses
    addrs.length.should be == 2
    
    addr1 = addrs[0]
    addr1.address1.should be == "123 Fun circle"
    addr1.address2.should be == ""
    addr1.city.should be == "Nomans"
    addr1.state.should be == "ME"
    addr1.zip.should be == 12345
    addr1.created_at.should_not be_nil
    addr1.updated_at.should_not be_nil
    addr1.verified.should be_false
    
    addr2 = addrs[1]
    addr2.address1.should be == "456 Busy street"
    addr2.address2.should be == "Suite 666"
    addr2.city.should be == "Nomans"
    addr2.state.should be == "ME"
    addr2.zip.should be == 12345
    addr2.type.should be == "work"
    addr2.created_at.should_not be_nil
    addr2.updated_at.should_not be_nil
    addr2.verified.should be_false
    
    #Validate the phone numbers
    phone_numbers = person.phone_numbers
    phone_numbers.length.should be == 2
    
    phone1 = phone_numbers[0]
    phone1.phone_number.should be == "555-123-4567"
    phone1.type.should be == "home"
    phone1.created_at.should_not be_nil
    phone1.updated_at.should_not be_nil
    phone1.verified.should be_false
    
    phone2 = phone_numbers[1]
    phone2.phone_number.should be == "666-987-6543"
    phone2.type.should be == "work"
    phone2.created_at.should_not be_nil
    phone2.updated_at.should_not be_nil
    phone2.verified.should be_false
    
    
    #Validate the email address
    emails = person.email_addresses
    emails.length.should be == 2
    
    email1 = emails[0]
    email1.email.should be == "john.doe@home.com"
    email1.type.should be == "personal"
    email1.created_at.should_not be_nil
    email1.updated_at.should_not be_nil
    email1.verified.should be_false
    
    email2 = emails[1]
    email2.email.should be == "john.doe@work.com"
    email2.type.should be == "work"
    email2.created_at.should_not be_nil
    email2.updated_at.should_not be_nil
    email2.verified.should be_false
    
    #person..should be == ""
    #person..should be == ""
    #person..should be == ""
    #person..should be == ""
    
  end
  
  it "should be able to change address" do
    @person.save
    person = Person.where(first: "John", last: "Doe").first
    person.addresses[0].address1 = "321 Nofun driver"
    person.update
    
    updated_person = Person.where(first: "John", last: "Doe").first
    expect(updated_person.addresses[0].address1).to be == "321 Nofun driver"
  end
  
=begin
  it "should not allow duplicate users" do
    expect(Person.create_indexes).to be_true
        
    @person.save
        
    newPerson = FactoryGirl.build(:person);
    newPerson.addresses = [FactoryGirl.build(:home_address), FactoryGirl.build(:work_address)]
    newPerson.email_addresses = [FactoryGirl.build(:personal_email),FactoryGirl.build(:work_email)]
    newPerson.phone_numbers = [FactoryGirl.build(:home_phone),FactoryGirl.build(:work_phone)]
    expect {newPerson.save!}.to raise_error
  end
=end

  
  
  it "should be able to change phone numbers" do 
    @person.save
    
    #pre-test
    people = Person.where(first: "John", last: "Doe", "phone_numbers.phone_number" => "555-555-5555")
    expect(people.count).to be == 0
    
    #build up test-case
    people = Person.where(first: "John", last: "Doe")
    person = people.first
    person.phone_numbers[0].phone_number = "555-555-5555"
    person.update
    
    #Test for update
    people = Person.where(first: "John", last: "Doe", "phone_numbers.phone_number" => "555-555-5555")
    expect(people.count).to be == 1
        
    updated_person = people.first
    expect(updated_person.phone_numbers[0].phone_number).to be == "555-555-5555"
  end
  
  #Test delete/paranoid
  it "should not ever be completely deleted" do
    #@todo: implement
  end
  
  it "should be able to add a new phone number" do
    @person.save
    
    #Pre-test
    person = Person.where(first: "John", last: "Doe").first
    expect(person.phone_numbers.count).to be == 2
    
    #build up test-case
    new_phone_number = PhoneNumber.new(phone_number: "888-666-0000", type: "mobile")
    person.phone_numbers << new_phone_number
    person.update
    
    #Test the update
    people = Person.where(first: "John", last: "Doe", "phone_numbers.phone_number" => "888-666-0000")
    expect(people.count).to be == 1
    
  end
  
end
