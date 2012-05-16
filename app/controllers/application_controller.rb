class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :get_ransak_object

=begin
  unless ActionController::Base.consider_all_requests_local
    rescue_from Exception, :with => :render_error
    rescue_from ActiveRecord::RecordNotFound, :with => :render_not_found
    rescue_from ActionController::RoutingError, :with => :render_not_found
    rescue_from ActionController::UnknownController, :with => :render_not_found
    rescue_from ActionController::UnknownAction, :with => :render_not_found
  end 
=end

  private
  def get_ransak_object
    @q = Question.search(params[:q])
  end
  
=begin 
  def render_not_found(exception)
    log_error(exception)
    render :template => "/error/page_404.html.haml", :status => 404
  end
  
  def render_error(exception)
    log_error(exception)
    render :template => "/error/page_500.html.haml", :status => 500
  end
=end
end
