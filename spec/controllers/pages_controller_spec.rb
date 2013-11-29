describe PagesController do
  describe "GET pages" do
    xit "GET impressum shuld be success" do
      get :imprint
      response.should render_template("shared/imprint")
    end
    xit "GET impressum should be success" do
      get :about
      response.should render_template("shared/about")
    end
  end
end