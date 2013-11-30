describe CategoriesController do
  describe "actions" do
    xit "get show should be success" do
      @category = FactoryGirl.create(:category)
      get :show, category: @category
      response.should be_success
    end
  end
end