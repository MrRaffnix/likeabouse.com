require "spec_helper"

describe PostsHelper do
  let(:post_with_category) { create(:post_with_category) }
  let(:category) { create(:category) }

  describe "#link_to_category" do
    before(:each) do
      @link = helper.link_to_category(category)
    end
    it "should return remote link to category" do
      @link.should match(/href=.#{helper.category_path(category)}/)
      @link.should match(/data-remote=.true/)
      @link.should match(/#{category.name}/)
      @link.should match(/class=.jq_category_link/)
    end
  end

  describe "#link_to_post" do
    before(:each) do
      @link = helper.link_to_post(post_with_category)
    end

    it "should return remote link to post" do
      @link.should match(/href=.#{helper.extended_post_path(post_with_category)}/)
      @link.should match(/data-remote=.true/)
      @link.should match(/#{post_with_category.name}/)
      @link.should match(/class=.jq_open_post/)
    end
  end

  describe "#extended_post_path" do
    it "should return the link to post path with name" do
      helper.extended_post_path(post_with_category).should eql("#{helper.post_path(post_with_category)}-#{post_with_category.name_to_path}")
    end
  end

  describe "#extended_post_url" do
    it "should return the link to post url with name" do
      helper.extended_post_url(post_with_category).should eql("#{helper.post_url(post_with_category)}-#{post_with_category.name_to_path}")
    end
  end

  describe "#link_to_post_link" do
    context "when mode is :name" do
      context "when truncate is true" do
        before(:each) do
          @link = helper.link_to_post_link(post_with_category, :name, true)
        end

        xit "should return external link to post with name" do
          @link.should match(/href=.#{post_with_category.link}/)
          @link.should match(/target=.blank/)
          @link.should match(/\>#{post_with_category.name}/)
        end
      end

      context "when truncate is false" do
        before(:each) do
          @link = helper.link_to_post_link(post_with_category, :name, false)
        end

        xit "should return external link to post with name" do
          @link.should match(/href=.#{post_with_category.link}/)
          @link.should match(/target=.blank/)
          @link.should match(/\>#{post_with_category.name}/)
        end
      end
    end

    context "when mode is :link" do
      context "when truncate is true" do
        before(:each) do
          @link = helper.link_to_post_link(post_with_category, :link, true)
        end

        it "should return remote link to post's link" do
          @link.should match(/href=.#{post_with_category.link}/)
          @link.should match(/target=.blank/)
          @link.should match(/\>#{helper.truncate_link(post_with_category.link)}/)
        end
      end

      context "when truncate is false" do
        before(:each) do
          @link = helper.link_to_post_link(post_with_category, :link, false)
        end

        it "should return remote link to post's link" do
          @link.should match(/href=.#{post_with_category.link}/)
          @link.should match(/target=.blank/)
          @link.should match(/\>#{post_with_category.link}/)
        end
      end
    end
  end

  describe "#post_css_class" do
  end

  describe "#posts_to_json" do
  end
end