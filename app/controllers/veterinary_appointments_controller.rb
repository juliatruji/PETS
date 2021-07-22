class VeterinaryAppointmentsController < BaseController
  include Rails::Pagination
  before_action :ensure_and_set_current_admin
  before_action :find_veterinary_appointment, only: [:show, :update, :destroy]

  def index
    veterinary_appointments = VeterinaryAppointment.all.order(created_at: :desc)
    paginate_items = paginate veterinary_appointments, per_page: params[:per_page]
    render json: paginate_items, each_serializer: VeterinaryAppointmentSerializer
  end

  def show
    render json: @veterinary_appointment
  end

  def create
    veterinary_appointment = VeterinaryAppointment.new(permit_params)
    if veterinary_appointment.save
      render json: {
        status: "success",
        message: "Pet created successfully",
        data: ActiveModelSerializers::Adapter::Json.new(VeterinaryAppointmentSerializer.new(veterinary_appointment)).as_json,
      }, status: :ok
    else
      render json: {
        status: "error",
        message: "An error occurred while creating veterinay appointment"
      }, status: :unprocessable_entity
    end
  end

  def update
    if @veterinary_appointment.update(permit_params)
      render json: {
        status: 'success',
        message: 'Veterinary updated successfully',
        data: ActiveModelSerializers::Adapter::Json.new(VeterinaryAppointmentSerializer.new(@veterinary_appointment)).as_json,
      }, status: :ok
    else
      render json: {
        status: "error",
        message: "An error occurred while updating Veterinary"
      }, status: :unprocessable_entity
    end
  end

  def destroy
    if @veterinary_appointment.destroy
      render json: {
        status: 'success',
        message: 'vacinness deleted successfully',
        data: ActiveModelSerializers::Adapter::Json.new(VeterinaryAppointmentSerializer.new(@veterinary_appointment)).as_json,
      }, status: :ok
    else
      render json: {
        status: "error",
        message: "An error occurred while deleted vacinness"
      }, status: :unprocessable_entity
    end
  end

  def permit_params
    params.require(:veterinary_appointment).permit(
                  :image,
                  :date,
                  :control_type,
                  :pet_id)
  end

  def find_veterinary_appointment
    @veterinary_appointment = VeterinaryAppointment.find(params[:id])
  end
end
