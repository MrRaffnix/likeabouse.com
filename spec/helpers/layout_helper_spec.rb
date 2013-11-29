require "spec_helper"

describe LayoutHelper do
  describe "#datetime_string" do
    before(:each) do
      @datetime = Time.utc(2013,5,12,12,0,1)
    end
    context "when a valid date given" do
      it "should return formatted date in localtime" do
        helper.datetime_string(@datetime).should eql("12.05.2013 14:00")
      end
    end

    context "when no date given" do
      it "should return '-'" do
        helper.datetime_string(nil).should eql("-")
      end
    end
  end
end