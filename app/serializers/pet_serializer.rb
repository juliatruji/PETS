class PetSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :race,
             :gender,
             :color,
             :sterilized,
             :size,
             :image,
             :adoption_status,
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
