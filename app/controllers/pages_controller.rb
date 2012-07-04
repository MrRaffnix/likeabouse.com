class PagesController < ApplicationController
  layout "full"
  
  def imprint
    render template: "shared/imprint"
  end
  
  def about
    @js_files = ["about"]
    render template: "shared/about"
  end
end