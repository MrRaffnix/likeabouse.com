describe PostsController do
  describe "GET recent" do
    it "shuld be success" do
      get :recent
      response.should be_success
    end
  end
end