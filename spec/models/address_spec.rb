require 'spec_helper'

#Embedded document. Only the parent documents can save it.
describe Address do
  
  it "should not be able to create a standalone Address document" do
    expect {FactoryGirl.create(:home_address)}.to raise_exception
  end
  
end
