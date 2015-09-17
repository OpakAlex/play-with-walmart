class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  before_action :enable_cors_headers

  def cors_preflight_check
    enable_cors_headers
    render nothing: true, content_type: 'text/plain'
  end

  protected

 def enable_cors_headers
    if request.headers["HTTP_ORIGIN"]
      headers['Access-Control-Allow-Origin']       = '*'
      headers['Access-Control-Expose-Headers']     = 'ETag'
      headers['Access-Control-Allow-Methods']      = 'GET, POST, PUT, DELETE, OPTIONS, HEAD'
      headers['Access-Control-Allow-Headers']      = 'x-requested-with, Content-Type, origin, authorization, accept, client-security-token'
    end
  end

end
