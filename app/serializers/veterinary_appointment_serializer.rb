class VeterinaryAppointmentSerializer < ActiveModel::Serializer
  attributes :id,
             :image,
             :date,
             :control_type,
             :created_at,
             :updated_at

  belongs_to :pet, serializer: PetSerializer
  def image
    return nil if object.image.blank?

    {
      url: object.image.url,
      name: object.image_identifier
    }
  end
end
