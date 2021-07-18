class AdoptersController < BaseController
  before_action :ensure_and_set_current_admin
  before_action :find_adopter, only: [:show, :update]

  def index
    adopters = Adopter.all
    render json: adopters, each_serializer: AdopterSerializer
  end

  def show
    render json: @adopter
  end

  def create
    adopter = Adopter.new(permit_params)
    if adopter.save
      render json: {
        status: "success",
        message: "adopter created successfully",
        data: ActiveModelSerializers::Adapter::Json.new(AdopterSerializer.new(adopter)).as_json,
      }, status: :ok
    else
      render json: {
        status: "error",
        message: "An error occurred while creating adopter"
      }, status: :unprocessable_entity
    end
  end

  def update
    if @adopter.update(permit_params)
      render json: {
        status: 'success',
        message: 'adopter updated successfully',
        data: ActiveModelSerializers::Adapter::Json.new(AdopterSerializer.new(@adopter)).as_json,
      }, status: :ok
    else
      render json: {
        status: "error",
        message: "An error occurred while updating adopter"
      }, status: :unprocessable_entity
    end
  end

  def permit_params
    params.require(:adopter).permit(
                  :name,
                  :dni,
                  :address,
                  :cel,
                  :age)
  end

  def find_adopter
    @adopter = Adopter.find(params[:id])
  end
end
