class VeterinaryAppointmentSerializer < ActiveModel::Serializer
  attributes :id,
             :image,
             :control_type,
             :pet_id,
             :created_at,
             :updated_at
  def image
    return nil if object.image.blank?

    {
      url: object.image.url,
      name: object.image_identifier
    }
   end
end
