class AdopterSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :dni,
             :address,
             :cel,
             :age,
             :created_at,
             :updated_at
end