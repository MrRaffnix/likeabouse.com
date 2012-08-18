require 'spec_helper'

describe Post do

  it "should validate presence of" do
    person = create(:post)
    person.should be_valid
  end

end