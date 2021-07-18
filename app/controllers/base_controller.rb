class BaseController < ActionController::Base
  include Pundit
  # before_action :authenticate_admin!
  rescue_from Pundit::NotAuthorizedError, with: :not_found
  # protect_from_forgery with: :null_session
  # protect_from_forgery except: :exception
  # before_action :set_cors_headers

  skip_before_action :verify_authenticity_token
  layout false

  def pundit_admin
    @current_admin
  end

  protected

  def ensure_and_set_current_admin
    authenticate = GetAdmin.new(request.headers['Authorization']).call
    if authenticate.success?
      @current_admin = authenticate.result
    elsif current_admin.present?
      @current_admin = current_admin
    else
      head :forbidden
    end
  end

  private

  # def set_cors_headers
  #   response.set_header "Access-Control-Allow-Origin", origin
  # end

  # def origin
  #   request.headers["Origin"] || "*"
  # end

  def not_found(exception)
    Raven.capture_exception(exception)
    render_not_found
  end

end
