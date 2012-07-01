describe PagesController do
  describe "GET index" do
    it "shuld be success" do
      get :impressum
      response.should render_template("shared/impressum")
    end
  end
end