class DemosController < ActionController::Base
  skip_before_action :verify_authenticity_token
  before_action :find_pet, only: [:show, :update]

  def index
    perros = Pet.all
    render json: perros
  end

  def show
    render json: @perro
  end

  def create
    perro = Pet.new(permit_params)
    if perro.save
      render json: {
        status: "success",
        message: "Pet created successfully"
      }, status: :ok
    else
      render json: {
        status: "error",
        message: "An error occurred while creating pet"
      }, status: :unprocessable_entity
    end
  end

  def update
    if @perro.update(permit_params)
      render json: {
        status: 'success',
        message: 'pet updated successfully'
      }, status: :ok
    else
      render json: {
        status: "error",
        message: "An error occurred while updating pet"
      }, status: :unprocessable_entity
    end
  end

  def permit_params
    params.permit(:id,
                  :name,
                  :pet_type,
                  :gender,
                  :race,
                  :sterilized)
  end

  def find_pet
    @perro = Pet.find(params[:id])
  end
end
