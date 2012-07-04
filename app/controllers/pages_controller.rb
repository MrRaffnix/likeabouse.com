class PagesController < ApplicationController
  
  def imprint
    render template: "shared/imprint"
  end
  def about
    render template: "shared/about", layout: "about"
  end
end