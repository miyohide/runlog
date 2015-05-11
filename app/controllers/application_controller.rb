class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  protect_from_forgery with: :exception

  before_filter :require_login

  rescue_from Pundit::NotAuthorizedError, with: :render_404

  private
  def not_authenticated
    redirect_to login_path, alert: "Please login first"
  end

  def render_404(exception = nil)
    if exception
      logger.info "Rendering 404 with exception: #{exception.message}"
    end

    render file: "#{Rails.root}/public/404.html", status: 404, content_type: "text/html"
  end
end
