require "spec_helper"

describe Project do
  it "is not valid without a name" do
    project=Project.new :name => nil
    project.should_not be_valid
  end
end
