require "spec_helper"

describe HtmlHelper do
  describe "#link_to_blank" do
    it "should extend link_to with target: _blank" do
      helper.link_to_blank("doodle", "#doodle", {}).should match(/target=\"blank\"/)
    end
  end

  describe "#active_class" do
    context "when condition is true" do
      context "and class is given" do
        it "should return klass connected with active" do
          helper.active_class(true, "doodle").should eql("doodle active")
        end
      end
      context "and no class is given" do
        it "should return just active klass" do
          helper.active_class(true, "").should eql("active")
        end
      end
    end
    context "when condition is false" do
      context "and class is given" do
        it "should return klass connected with active" do
          helper.active_class(false, "doodle").should eql("doodle")
        end
      end
    end
    context "and no class is given" do
      it "should return just empty string" do
        helper.active_class(false, "").should eql("")
      end
    end
  end
end