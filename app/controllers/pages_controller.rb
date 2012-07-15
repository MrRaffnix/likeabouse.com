class PagesController < ApplicationController
  layout "full"

  def imprint
    render 'shared/imprint'
  end

  def about
    @js_files = ["about"]
    render 'shared/about'
  end
end