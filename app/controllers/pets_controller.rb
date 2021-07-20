class PetsController < BaseController
  include Rails::Pagination
  before_action :ensure_and_set_current_admin
  before_action :find_pet, only: [:show, :update, :destroy]

  def index
    pets = Pet.all
    pets = pets.where(adoption_status: true) if params[:adoption_status].present? && params[:adoption_status] == "true"
    pets = pets.where(sterilized: true) if params[:sterilized].present? && params[:sterilized] == "true"
    search = params[:q]
    if search.present?
      pattern = "%#{search.strip}%"
      pets = pets.where(
        'pets.name ILIKE :pattern
        OR pets.race ILIKE :pattern
        OR pets.gender ILIKE :pattern
        OR pets.color ILIKE :pattern
        OR pets.size ILIKE :pattern',
        pattern: pattern
      )
    end
    pets = pets.order(created_at: :desc)
    paginate_items = paginate pets, per_page: params[:per_page]
    render json: paginate_items, each_serializer: PetSerializer
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

  def destroy
    if @pet.adoption_status == false && @pet.destroy
      render json: {
        status: 'success',
        message: 'pet deleted successfully',
        data: ActiveModelSerializers::Adapter::Json.new(PetSerializer.new(@pet)).as_json,
      }, status: :ok
    else
      render json: {
        status: "error",
        message: "An error occurred while deleted pet"
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
