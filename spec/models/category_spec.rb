require 'spec_helper'

describe Category do
  let(:category) { create(:category) }
  subject { category }

  it { should have_many(:posts) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:rank) }
  it { should validate_uniqueness_of(:rank) }

  describe "scopes" do
    context ".ordererd" do
      before(:each) do
        @cat_one    = create(:category, rank: 3)
        @cat_two    = create(:category, rank: 1)
        @cat_three  = create(:category, rank: 2)
      end

      it "should return categories in correct order" do
        Category.ordered.to_a.should eql([@cat_two, @cat_three, @cat_one])
      end
    end
  end

  describe ".to_show" do
    before(:each) do
      @cat_one    = create(:category, rank: 3)
      @cat_two    = create(:category, rank: 1)
      @cat_three  = create(:category, rank: 2, post_ids: [])

      create(:post, category_id: @cat_one.id)
      create(:post, category_id: @cat_two.id)
      create(:post, category_id: @cat_two.id)

      @categories_to_show = Category.to_show
      @category_ids = @categories_to_show.map(&:id)
    end

    it "should sort by rank" do
      @categories_to_show.map(&:rank) == [1,3]
    end

    it "should return all categories with posts" do
      @category_ids.should include(@cat_one.id)
      @category_ids.should include(@cat_two.id)
    end

    it "should not return categories without posts" do
      @category_ids.should_not include(@cat_three.id)
    end
  end

  describe "recent_posts" do
    before(:each) do
      Post.paginates_per(1)

      @post_one   = create(:post, category_id: category.id, created_at: 1.hour.ago)
      @post_two   = create(:post, category_id: category.id, created_at: 1.minute.ago)
      @post_three = create(:post, category_id: category.id, created_at: 1.day.ago)
    end
    context "when page param is given" do
      it "should return posts ordered by created at" do
        category.recent_posts(1).map(&:id).should eql([@post_two.id])
        category.recent_posts(2).map(&:id).should eql([@post_one.id])
        category.recent_posts(3).map(&:id).should eql([@post_three.id])
      end
    end

    context "when no page param is given" do
      it "should return the first page" do
        category.recent_posts.map(&:id).should eql(category.recent_posts(1).map(&:id))
      end
    end
  end
end