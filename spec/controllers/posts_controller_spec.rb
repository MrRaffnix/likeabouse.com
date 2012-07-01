describe PostsController do
  describe "GET index" do
    it "shuld be success" do
      get :index
      response.should be_success
    end
    it "shuld be success" do
      get :show, id: 1
      response.should be_success
    end
  end
end