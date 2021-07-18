class PetsController < BaseController
  before_action :ensure_and_set_current_admin
  before_action :find_pet, only: [:show, :update]

  def index
    pets = Pet.all
    render json: pets, each_serializer: PetSerializer
  end

  def show
    render json: @pet
  end

  def create
    pet = Pet.new(permit_params)
    if pet.save
      render json: {
        status: "success",
        message: "Pet created successfully",
        data: ActiveModelSerializers::Adapter::Json.new(PetSerializer.new(pet)).as_json,
      }, status: :ok
    else
      render json: {
        status: "error",
        message: "An error occurred while creating pet"
      }, status: :unprocessable_entity
    end
  end

  def update
    if @pet.update(permit_params)
      render json: {
        status: 'success',
        message: 'pet updated successfully',
        data: ActiveModelSerializers::Adapter::Json.new(PetSerializer.new(@pet)).as_json,
      }, status: :ok
    else
      render json: {
        status: "error",
        message: "An error occurred while updating pet"
      }, status: :unprocessable_entity
    end
  end

  def permit_params
    params.require(:pet).permit(
                  :name,
                  :race,
                  :gender,
                  :color,
                  :sterilized,
                  :size,
                  :image,
                  :adoption_status)
  end

  def find_pet
    @pet = Pet.find(params[:id])
  end
end
