class DemoSerializer < ActiveModel::Serializer
 attributes :id,
            :name,
            :race,
            :type,
            :gender,
            :sterilized
end

