require "spec_helper"

describe Task do
  it "is not valid without a description" do
    task=Task.new :description => nil
    task.should_not be_valid
  end
end
