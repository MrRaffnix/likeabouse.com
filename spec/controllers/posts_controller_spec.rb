describe PostsController do
  describe "actions" do
    it "get index should be success" do
      get :index
      response.should be_success
    end
    it "get search should be success" do
      xhr :get, :search
      response.should be_success
    end
    xit "should call xhr and be a success" do
      xhr :get, :show
      should render :show
    end
  end
end