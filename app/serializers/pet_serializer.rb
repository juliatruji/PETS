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
end
