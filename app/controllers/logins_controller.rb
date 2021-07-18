class LoginsController < BaseController
  def create
    authenticate = Authenticate.new(user_params[:email], user_params[:password]).call
    if authenticate.success?
      render(json: authenticate.result, status: :ok)
    else
      render(json: {
        status: 'error',
        errors: authenticate.errors,
        message: 'An error ocurred',
      }, status: :unauthorized)
    end
  end

  private

  def user_params
    params.permit(:email, :password)
  end
end
