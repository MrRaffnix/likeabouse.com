require 'spec_helper'

describe Post do
  let(:post_with_category) { create(:post_with_category) }
  subject { post_with_category }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:link) }
  it { should validate_presence_of(:category_id) }
  it { should validate_presence_of(:author_id) }

  it { should belong_to(:author) }
  it { should belong_to(:category) }

  describe ".search" do
    before(:each) do
      @post_name  = create(:post_with_category, name: "Rails 4 Destroyer", description: "This is a cool Thing")
      @post_desc  = create(:post_with_category, name: "Kaminari", description: "A cool Gem usable in rails")
      @post_both  = create(:post_with_category, name: "Rails Nerds", description: "A Thing about rails Nerdies")
      @post_none  = create(:post_with_category, name: "Good Guys", description: "We are good guys :)")
      @post_other = create(:post_with_category, name: "Jquery Godlike", description: "This is my coffeescript stuff")
    end

    context "when i search for rails" do
      before(:each) do
        @result_ids = Post.search("Rails").map(&:id)
      end

      it "should return three posts" do
        @result_ids.should have(3).items
      end

      it "should return all posts matching name/description" do
        @result_ids.should include(@post_name.id)
        @result_ids.should include(@post_desc.id)
        @result_ids.should include(@post_both.id)
      end

      it "should not return non matching posts" do
        @result_ids.should_not include(@post_none.id)
        @result_ids.should_not include(@post_other.id)
      end
    end
    context "when i search for jquery" do
      before(:each) do
        @result_ids = Post.search("Jquery").map(&:id)
      end

      it "should return three posts" do
        @result_ids.should have(1).item
      end

      it "should return all posts matching name/description" do
        @result_ids.should include(@post_other.id)
      end
      it "should not return non matching posts" do
        @result_ids.should_not include(@post_none.id)
        @result_ids.should_not include(@post_name.id)
        @result_ids.should_not include(@post_desc.id)
        @result_ids.should_not include(@post_both.id)
      end
    end
  end

  describe "#related_posts" do
    before(:each) do
      category_one = create(:category)
      category_two = create(:category)

      @post_c11 = create(:post, category_id: category_one.id, created_at: 1.minute.ago)
      @post_c12 = create(:post, category_id: category_one.id, created_at: 1.hour.ago)
      @post_c13 = create(:post, category_id: category_one.id, created_at: 1.day.ago)
      @post_c21 = create(:post, category_id: category_two.id, created_at: 1.minute.ago)
      @post_c22 = create(:post, category_id: category_two.id, created_at: 1.hour.ago)
      @post_c23 = create(:post, category_id: category_two.id, created_at: 1.day.ago)
    end
    it "should return recent posts(excluding himself) for his category (category_one)" do
      @post_c11.related_posts.map(&:id).should eql([@post_c12.id, @post_c13.id])
      @post_c12.related_posts.map(&:id).should eql([@post_c11.id, @post_c13.id])
      @post_c13.related_posts.map(&:id).should eql([@post_c11.id, @post_c12.id])
    end
    it "should return recent posts(excluding himself) for his category (category_one)" do
      @post_c21.related_posts.map(&:id).should eql([@post_c22.id, @post_c23.id])
      @post_c22.related_posts.map(&:id).should eql([@post_c21.id, @post_c23.id])
      @post_c23.related_posts.map(&:id).should eql([@post_c21.id, @post_c22.id])
    end
  end

  describe "#name_to_path" do
    before(:each) do
      @post = post_with_category
    end
    it "should return name as url appendix" do
      @post.name = "The Little  Secret"
      @post.name_to_path.should eql("the-little-secret")
      @post.name = "Grunt"
      @post.name_to_path.should eql("grunt")
      @post.name = "Rails 4 Diff Cheatsheet"
      @post.name_to_path.should eql("rails-4-diff-cheatsheet")
    end
  end
end