class AdoptionSerializer < ActiveModel::Serializer
  attributes :id,
             :date,
             :created_at,
             :updated_at

  belongs_to :admin, serializer: AdminSerializer
  belongs_to :pet, serializer: PetSerializer
  belongs_to :adopter, serializer: AdopterSerializer
end
