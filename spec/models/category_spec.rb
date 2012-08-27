require 'spec_helper'

describe Category do

  it "should validate presence of" do
    category = create(:category)
    category.should be_valid
  end

  it "should call no_posts" do
    category = create(:category)
    category.no_posts?.should be_true
  end
end