describe PostsController do
  describe "GET recent" do
    it "should be success" do
      get :recent
      response.should be_success
    end
    it "should get xhr recent and be a success" do
      xhr :get, :recent
      response.should be_success
    end
    it "should call xhr and be a success" do
      xhr :get, :recent
      should render_template(:partial => "posts/_index")
    end
  end
end