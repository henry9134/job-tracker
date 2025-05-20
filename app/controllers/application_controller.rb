class ApplicationController < ActionController::Base
  respond_to :html, :json 
  protect_from_forgery with: :exception

  # ✅ Override Devise to handle API requests without redirecting
  def authenticate_user!
    if request.path.start_with?("/api")
      token = request.headers['Authorization']&.split('Bearer ')&.last
      @current_user = User.find_by(api_token: token)

      unless @current_user
        render json: { error: "Unauthorized (from ApplicationController)" }, status: :unauthorized and return
      end
    else
      super
    end
  end
end
