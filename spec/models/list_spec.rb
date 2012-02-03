require "spec_helper"

describe List do
  it "is not valid without a name" do
    list=List.new :name => nil
    list.should_not be_valid
  end 
end

