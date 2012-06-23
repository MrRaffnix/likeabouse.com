class PagesController < ApplicationController
  def impressum
    render template: "shared/impressum"
  end
  
end