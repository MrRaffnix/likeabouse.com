class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :set_meta_defaults
  
  helper :all
  
  def set_meta_defaults
    @description  = "Short descriptions and links for novice to experienced web developers"
    @keywords     = "ruby, ruby on rails, rails, gems, javascript, css, links, programming, agile, testing"
    @title        = "Like A Bouse"
  end
end
