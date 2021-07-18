class AdoptionsController < BaseController
  include Rails::Pagination
  before_action :ensure_and_set_current_admin
  before_action :find_adoption, only: [:show, :update]

  def index
    adoptions = Adoption.all
    paginate_items = paginate adoptions, per_page: params[:per_page]
    render json: paginate_items, each_serializer: AdoptionSerializer
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

  def find_adoption
    @adoption = Adoption.find(params[:id])
  end
end
