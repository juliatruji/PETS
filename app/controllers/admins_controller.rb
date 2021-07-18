class AdminsController < BaseController
  before_action :ensure_and_set_current_admin
  before_action :find_admin, only: [:show]

  def index
    admins = Admin.all
    render json: admins, each_serializer: AdminSerializer
  end

  def show
    render json: @admin
  end

  def find_admin
    @admin = Admin.find(params[:id])
  end
end
