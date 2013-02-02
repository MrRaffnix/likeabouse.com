class PagesController < ApplicationController
  layout "application"

  def imprint
    render 'shared/imprint'
  end

  def about
    @js_files = ["about"]
    render 'shared/about'
  end
end