class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :get_ransak_object
  
  private
  def get_ransak_object
    @q = Question.search(params[:q])
  end
end
