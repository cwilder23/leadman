require 'spec_helper'

#Embedded document. Only the parent documents can save it.
describe PhoneNumber do
  
  it "should not be able to create a standalone PhoneNumber document" do
    expect {FactoryGirl.create(:home_phone)}.to raise_exception
  end
  
end
