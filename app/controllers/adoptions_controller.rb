class AdoptionsController < ActionController::Base
  skip_before_action :verify_authenticity_token
  before_action :adoption, only: [:show, :update]

  def index
    adoptions = Adoption.all
    render json: adoptions, each_serializer: AdoptionSerializer
  end

  def show
    render json: @adoption
  end

  def create
    adoption = Adoption.new(permit_params)
    if adoption.save
      render json: {
        status: "success",
        message: "Adoption created successfully"
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
        message: 'Adoption updated successfully'
      }, status: :ok
    else
      render json: {
        status: "error",
        message: "An error occurred while updating Adoption"
      }, status: :unprocessable_entity
    end
  end

  def permit_params
    params.require(:adoption).permit(
                  :date,
                  :pet_id,
                  :admin_id,
                  :adopter_id)
  end

  def find_veterinary_appointment
    @veterinary_appointment = VeterinaryAppointment.find(params[:id])
  end
end
