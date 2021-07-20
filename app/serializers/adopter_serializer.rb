class AdopterSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :dni,
             :address,
             :cel,
             :age,
             :count_pets,
             :created_at,
             :updated_at
  has_one :pets, serializer: PetSerializer

  def count_pets
    object.pets.size
  end
end
