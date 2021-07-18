class AdoptionsController < BaseController
  before_action :ensure_and_set_current_admin
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
