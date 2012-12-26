require 'spec_helper'

#Embedded document. Only the parent documents can save it.
describe Email do
  
  it "should not be able to create a standalone Email document" do
    expect {FactoryGirl.create(:personal_email)}.to raise_exception
  end
  
end
