class AdoptersController < ActionController::Base
  skip_before_action :verify_authenticity_token
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
        message: "adopter created successfully"
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
        message: 'adopter updated successfully'
      }, status: :ok
    else
      render json: {
        status: "error",
        message: "An error occurred while updating adopter"
      }, status: :unprocessable_entity
    end
  end

  def permit_params
    params.require(:adopter).permit(:id,
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
