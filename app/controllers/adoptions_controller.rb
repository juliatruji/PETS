class AdoptionsController < BaseController
  include Rails::Pagination
  before_action :ensure_and_set_current_admin
  before_action :find_adoption, only: [:show, :update]

  def index
    adoptions = Adoption.all
    # adoptions = adoptions.where(adoption_status: true) if params[:adoption_status].present? && params[:adoption_status] == "true"
    # adoptions = adoptions.where(sterilized: true) if params[:sterilized].present? && params[:sterilized] == "true"
    search = params[:q]
    if search.present?
      pattern = "%#{search.strip}%"
      adoptions = adoptions.left_outer_joins(:pet, :adopter, :admin).where(
        'pets.name ILIKE :pattern
        OR pets.race ILIKE :pattern
        OR pets.gender ILIKE :pattern
        OR pets.color ILIKE :pattern
        OR pets.size ILIKE :pattern
        OR adopters.name ILIKE :pattern
        OR adopters.dni ILIKE :pattern
        OR adopters.address ILIKE :pattern
        OR adopters.cel ILIKE :pattern
        OR admins.name ILIKE :pattern
        OR admins.user ILIKE :pattern',
        pattern: pattern
      ).distinct
    end
    adoptions = adoptions.order(created_at: :desc)
    paginate_items = paginate adoptions, per_page: params[:per_page]
    render json: paginate_items, each_serializer: AdoptionSerializer
  end

  def show
    render json: @adoption
  end

  def create
    adoption = Adoption.new(permit_params)
    if adoption.save
      adoption.pet.update(adoption_status: true)
      render json: {
        status: "success",
        message: "Adoption created successfully",
        data: ActiveModelSerializers::Adapter::Json.new(AdoptionSerializer.new(adoption)).as_json,
      }, status: :ok
    else
      render json: {
        status: "error",
        message: "An error occurred while creating adoption"
      }, status: :unprocessable_entity
    end
  end

  def update
    if @adoption.update(permit_params)
      render json: {
        status: 'success',
        message: 'Adoption updated successfully',
        data: ActiveModelSerializers::Adapter::Json.new(AdoptionSerializer.new(@adoption)).as_json,
      }, status: :ok
    else
      render json: {
        status: "error",
        message: "An error occurred while updating Adoption"
      }, status: :unprocessable_entity
    end
  end

  def permit_params
    params.require(:adoption)
          .permit(:date,
                  :pet_id,
                  :admin_id,
                  :adopter_id)
  end

  def find_adoption
    @adoption = Adoption.find(params[:id])
  end
end
