require "spec_helper"

describe ApplicationHelper do
  context "#left_categories" do
    before(:each) do
      create_category_set
      helper.stub(:categories_to_show).and_return(Category.to_show)
    end

    it "should return the first half(ceiled) of available categories" do
      helper.left_categories.map(&:id).should eql([@category_left2.id, @category_left1.id])
    end

    it "should return only categories which have posts" do
      helper.left_categories.map(&:id).should_not include(@category_no_posts)
    end
  end

  context "#right_categories" do
    before(:each) do
      create_category_set
      helper.stub(:categories_to_show).and_return(Category.to_show)
    end

    it "should return the second half(ceiled) of available categories" do
      helper.right_categories.map(&:id).should eql([@category_right1.id, @category_right3.id, @category_right2.id])
    end

    it "should return only categories which have posts" do
      helper.right_categories.map(&:id).should_not include(@category_no_posts)
    end
  end

  private

  def create_category_set
    @category_left1     = create(:category, rank: 2)
    @category_left2     = create(:category, rank: 1)
    @category_right1    = create(:category, rank: 3)
    @category_right2    = create(:category, rank: 5)
    @category_right3    = create(:category, rank: 4)
    @category_no_posts  = create(:category, rank: 6)

    create_post_for(@category_left1.id)
    create_post_for(@category_left2.id)
    create_post_for(@category_right1.id)
    create_post_for(@category_right2.id)
    create_post_for(@category_right3.id)
  end

  def create_post_for(category_id)
    create(:post, category_id: category_id)
  end
end